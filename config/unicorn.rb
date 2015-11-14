working_directory "/opt/patient_card"
pid "/opt/patient_card/tmp/pids/unicorn.pid"
stderr_path "/opt/patient_card/log/unicorn.err.log"
stdout_path "/opt/patient_card/log/unicorn.log"

listen "/tmp/unicorn.codetest.sock"
worker_processes 2
timeout 30