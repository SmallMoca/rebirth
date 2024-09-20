 let a = { a: '1' };
Object.assign(a, { a: '2' }, { a: '3' }, { a: 4 });
console.log(a);

//

// const  c  = []
#!/bin/bash
#
# author: 胡文栋
# email: huwendong@tuzhanai.com
# date: 2022/8/2 11:05
# version: v1.0.0
#
# 功能描述:
# 用于大健康后端项目启动

#使用帮助
function usage() {
  echo "usage: /bin/bash $0 -j health-report-web-1.0-SNAPSHOT.jar -n b-be-test-health-report-web -o \"-server -Xms512m -Xmx512m\" -s"
  echo "  -j: 后面跟 jar 包名称"
  echo "  -n: 后面跟 jenkins 的任务名称"
  echo "  -o: 后面跟 jvm 参数。必须使用双引号引住。如果不加 -o 选项则使用默认 JVM 参数"
  echo "  -s: 加上 -s 表示上报 skywalking 否则就不上报"
  echo "  -p: 后面跟需要检查的端口号,多个端口号之间使用空格分隔。用端口号判断程序是否正常启动。必须使用双引号引住。如果不加 -p 选项表示不需要检查端口号，则进程存在就任务程序已经启动"
}

#解析脚本的参数
function process_param() {
  local opt
  while getopts 'j:n:so:p:' opt; do
    case "$opt" in
      j)
        jar_name="$OPTARG"
        ;;
      n)
        job_name="$OPTARG"
        ;;
      o)
        jvm_opts="$OPTARG"
        ;;
      s)
        sw_enable="true"
        ;;
      p)
        check_ports="$OPTARG"
        ;;
      *)
        usage
        exit 1
        ;;
    esac
  done
}

#等待进程结束
function wait_process_finish() {
  local pid=""
  pid=$(jps -l | grep "$jar_name" | awk '{print $1}')

  local loop="6"
  if [ -z "$pid" ]; then
    return 0
  fi
  echo "The process already exists, prepare kill PID $pid."
  kill "$pid"
  local i
  for ((i = 0; i < "$loop"; i++)); do
    if ps --pid "$pid" &>/dev/null; then
      echo "Waiting for the process (PID is $pid) to finish..."
      sleep 5
    else
      break
    fi
  done
  if [ "$i" -eq "$loop" ]; then
    echo "The process (PID is $pid) can't be killed and will be forced to kill !!!"
    kill -9 "$pid"
    sleep 5
  fi
  echo "The process (PID is $pid) has ended."
}

#启动 java 进程
function start() {
  local launch_cmd="nohup java"
  if [ "$sw_enable" = "true" ]; then
    launch_cmd="$launch_cmd -javaagent:$sw_agent_jar"
  fi
  launch_cmd="$launch_cmd $jvm_opts -jar /tmp/$jar_name &> /dev/null &"
  echo "The launch cmd is \"$launch_cmd\""

  if [ "$sw_enable" = "true" ]; then
    echo "The java process $sw_agent_name is starting...."
    nohup java -javaagent:"$sw_agent_jar" \
      $jvm_opts -jar /tmp/"$jar_name" &>/dev/null &
    sleep 10
  else
    nohup java $jvm_opts -jar /tmp/"$jar_name" &>/dev/null &
    sleep 10
  fi
}

#检查端口是否存在，用于判断程序是否启动成功
function do_check_ports() {
  echo "prepare check ports..."
  local pid=""
  pid=$(jps -l | grep "$jar_name" | awk '{print $1}')
  echo "The java process $sw_agent_name has stated, pid is $pid"
  local text=""
  if [ -z "$check_ports" ]; then
    text="测试环境 $sw_agent_name 发版成功, 进程检查已通过!"
    do_web_hook "$text"
    return 0
  fi

  local old_ifs="$IFS"
  local e=""
  local loop=6
  local i=""
  local rs=0
  IFS=","
  for e in $check_ports; do
    for ((i = 0; i < "$loop"; i++)); do
      rs=$(netstat -tnlp | grep -c "$e")
      if [ "$rs" -eq 1 ]; then
        break
      fi
      sleep 10
    done
    if [ "$rs" -eq 0 ]; then
      text="⚠️⚠️测试环境 $sw_agent_name 发版可能失败，进程和端口号检查不通过，请人工确认!!!"
      do_web_hook "$text"
      exit 1
    fi
  done
  IFS="$old_ifs"

  text="测试环境 $sw_agent_name 发版成功，进程和端口号检查通过!"
  do_web_hook "$text"

  return 0
}

#企微告警通知
function do_web_hook() {
  local text=$1
  curl "$wecom_hook" \
    -H 'Content-Type: application/json' \
    -d "
      {
          \"msgtype\": \"text\",
          \"text\": {
              \"content\": \"$text\"
          }
      }"
}

#检查依赖
function check_required_dependency() {
  if [ -z "$jar_name" ]; then
    echo "miss jar name !!!"
    usage
    exit 1
  fi
  if [ -z "$job_name" ]; then
    echo "miss job name !!!"
    usage
    exit 1
  fi
  if [ "$sw_enable" = "true" ]; then
    sw_agent_name="${job_name##b-be-test-}"
    sw_logging_dir="/data1/bighealth/logs/$sw_agent_name/"
    sw_agent_dir="/data1/bighealth/logs/$sw_agent_name/skywalking-agent"
    sw_agent_jar="$sw_agent_dir/skywalking-agent.jar"
    # shellcheck source=./test_skywalking.env
    source "$sh_dir/test_skywalking.env"
    #    export -p
    if [ ! -e "$SW_AGENT" ]; then
      echo "miss skywalking agent jar"
      exit 1
    fi
    if [ ! -e "$sw_logging_dir" ]; then
      mkdir -p "$sw_logging_dir"
    fi
    rm -rf "$sw_agent_dir"
    \cp -rf /usr/local/skywalking-agent "$sw_logging_dir"
    export SW_AGENT_NAME="$sw_agent_name"
    export SW_LOGGING_DIR="$sw_logging_dir"
  fi
}

#获取当前脚本的绝对路径
function get_script_absolute_path() {
  sh_dir="$(
    cd -- "$(dirname "$0")" &>/dev/null || exit 1
    pwd -P
  )"
  if [ "$?" -eq 1 ]; then
    echo "get script path error !!!"
    exit 1
  fi
}

#######################################
# 大健康后端测试环境构建脚本
# Globals:
#   check_ports: 用于判断程序是否正常启动的端口
#   jar_name: 程序启动需要用到的 jar 包名称
#   job_name: jenkins 任务名称
#   jvm_opts: java 启动需要的 jvm 选项
#   sh_dir: 当前脚本的绝对路径
#   sw_agent_dir: skywalking agent 目录
#   sw_agent_jar: skywalking agent jar
#   sw_agent_name: 上报给 skywalking 的服务名称
#   sw_enable: 是否上报 skywalking
#   sw_logging_dir: skywalking agent 的日志目录
#   wecom_hook: 发版结果通知的 webhook 地址
# Arguments:
#######################################
 function main() {
  echo "参数个数 $# , The params is: $*"
  #是否上报 skywalking，默认false
  sw_enable="false"
  #jar 包的名称
  jar_name=""
  #jenkins 任务名称
  job_name=""
  #默认 jvm 参数
  jvm_opts="-server -Xms512m -Xmx512m -Xmn256m -Xss256k -XX:MetaspaceSize=64m -XX:MaxMetaspaceSize=128m -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:GCPauseIntervalMillis=201 -Duser.timezone=GMT+8 -Dfile.encoding=utf-8 -Devn=test -Dnacos_namespace=bighealth -Dnacos_addr=127.0.0.1 -Dnacos_port=8848"
  #用来判断程序是否启动的端口号,多个端口号使用空格分隔
  check_ports=""
  #  prometheus_opts="-javaagent:/usr/local/jmx_exporter/jmx_prometheus_javaagent-0.17.0.jar=12345:/usr/local/jmx_exporter/config.yml"
  #当前脚本的绝对路径
  sh_dir=""
  #上报给 skywalking 的服务名称
  sw_agent_name=""
  #skywalking 的日志地址
  sw_logging_dir=""
  #当前应用 skywalking agent 的目录
  sw_agent_dir=""
  #当前应用 skywalking agent 的 jar 地址
  sw_agent_jar=""
  #企微 skywalking-alarm-test 群，大健康测试环境后端发版告警机器人
  wecom_hook="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=56647175-7fd9-455f-996a-5dec562ac2a5"

  get_script_absolute_path
  process_param "$@"
  check_required_dependency
  wait_process_finish
  start
  do_check_ports
}

main "$@"