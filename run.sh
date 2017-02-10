# Run ingestion in 8 threads
time cat 1day_1000names_1sec_step_1.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_2.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_3.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_4.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_5.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_6.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_7.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
time cat 1day_1000names_1sec_step_8.gz | gunzip > /dev/tcp/127.0.0.1/8282 &
