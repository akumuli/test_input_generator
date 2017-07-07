# Run ingestion in 32 threads

# Group 1
time cat 1day_1000names_1sec_step_1.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_2.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_3.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_4.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_5.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_6.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_7.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_8.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_33.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &

# Group 2
time cat 1day_1000names_1sec_step_9.gz  | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_10.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_11.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_12.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_13.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_14.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_15.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_16.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_34.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &

# Group 3
time cat 1day_1000names_1sec_step_17.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_18.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_19.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_20.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_21.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_22.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_23.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_24.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_35.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &

# Group 4
time cat 1day_1000names_1sec_step_25.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_26.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_27.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_28.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_29.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_30.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_31.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_32.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &
time cat 1day_1000names_1sec_step_36.gz | gunzip > /dev/tcp/${TARGET_HOST}/8282 &

wait
