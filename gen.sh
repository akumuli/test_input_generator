# Generate 32 files

python2.7 main.py --rbegin=0   --rend=100 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_1.gz &
python2.7 main.py --rbegin=100 --rend=200 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_2.gz &
python2.7 main.py --rbegin=200 --rend=300 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_3.gz &
python2.7 main.py --rbegin=300 --rend=400 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_4.gz &
python2.7 main.py --rbegin=400 --rend=500 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_5.gz &
python2.7 main.py --rbegin=500 --rend=600 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_6.gz &
python2.7 main.py --rbegin=600 --rend=700 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_7.gz &
python2.7 main.py --rbegin=700 --rend=800 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_8.gz &

wait

python2.7 main.py --rbegin=800  --rend=900  --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_9.gz &
python2.7 main.py --rbegin=900  --rend=1000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_10.gz &
python2.7 main.py --rbegin=1000 --rend=1100 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_11.gz &
python2.7 main.py --rbegin=1100 --rend=1200 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_12.gz &
python2.7 main.py --rbegin=1200 --rend=1300 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_13.gz &
python2.7 main.py --rbegin=1300 --rend=1400 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_14.gz &
python2.7 main.py --rbegin=1400 --rend=1500 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_15.gz &
python2.7 main.py --rbegin=1500 --rend=1600 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_16.gz &

wait

python2.7 main.py --rbegin=1600 --rend=1700 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_17.gz &
python2.7 main.py --rbegin=1700 --rend=1800 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_18.gz &
python2.7 main.py --rbegin=1800 --rend=1900 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_19.gz &
python2.7 main.py --rbegin=1900 --rend=2000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_20.gz &
python2.7 main.py --rbegin=2000 --rend=2100 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_21.gz &
python2.7 main.py --rbegin=2100 --rend=2200 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_22.gz &
python2.7 main.py --rbegin=2200 --rend=2300 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_23.gz &
python2.7 main.py --rbegin=2300 --rend=2400 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_24.gz &

wait

python2.7 main.py --rbegin=2400 --rend=2500 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_25.gz &
python2.7 main.py --rbegin=2500 --rend=2600 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_26.gz &
python2.7 main.py --rbegin=2600 --rend=2700 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_27.gz &
python2.7 main.py --rbegin=2700 --rend=2800 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_28.gz &
python2.7 main.py --rbegin=2800 --rend=2900 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_29.gz &
python2.7 main.py --rbegin=2900 --rend=3000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_30.gz &
python2.7 main.py --rbegin=3000 --rend=3100 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_31.gz &
python2.7 main.py --rbegin=3100 --rend=3200 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_32.gz &

wait

python2.7 main.py --rbegin=3200 --rend=3300 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_33.gz &
python2.7 main.py --rbegin=3300 --rend=3400 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_34.gz &
python2.7 main.py --rbegin=3400 --rend=3500 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_35.gz &
python2.7 main.py --rbegin=3500 --rend=3600 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:01 | gzip > 1day_1000names_1sec_step_36.gz &
