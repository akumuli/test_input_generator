# Generate input
python2.7 main.py --rbegin=1    --rend=1000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_1.gz &
python2.7 main.py --rbegin=1001 --rend=2000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_2.gz &
python2.7 main.py --rbegin=2001 --rend=3000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_3.gz &
python2.7 main.py --rbegin=3001 --rend=4000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_4.gz &
python2.7 main.py --rbegin=4001 --rend=5000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_5.gz &
python2.7 main.py --rbegin=5001 --rend=6000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_6.gz &
python2.7 main.py --rbegin=6001 --rend=7000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_7.gz &
python2.7 main.py --rbegin=7001 --rend=8000 --tbegin=20170101T000000 --tend=20170102T000000 --tdelta=00:00:10 | gzip > 1day_1000names_1sec_step_8.gz &
