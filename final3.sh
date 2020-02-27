fname=adult.csv
temp=temp.csv
max=`cat $fname|grep '^[0-9]'|cut -d ',' -f 1|sort -nr|head -n 1`
min=`cat $fname|grep '^[0-9]'|cut -d ',' -f 1|sort -n|head -n 1`
nrecord=`cat $fname|grep '^[0-9]'|wc -l`
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "The Total number of records are $nrecord"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Enter the sample size"
read sampleSize

echo "Enter the number of samples"
read nSamples

echo "The minimum value is $min and the Maximum value is $max"
echo "------------------------"
echo "Enter the class interval"
read ci
echo "------------------------"

echo "SampleID -> Mean -> Variance -> SD"

for bha in `seq 1 1 $nSamples`
do

cat $fname|grep '^[0-9]'|shuf -n $sampleSize>$temp
x=0
x2=0
fx=0
fx2=0
cx=0 #Cummulative midpoint
cf=0 #Cummulative Frequency
cfx=0 #Cummulative Frequency * Midpoint
cx2=0 #Cummulative square of the midpoint
cfx2=0 #Cummulative frequency * square of the midpoint

ll=`echo "$min"`
start=$min
start1=`echo "$min+$ci"|bc`

for i in `seq $start1 $ci $max`
do
  count=0
  for j in `cat $temp|cut -d ',' -f 1`
          do
          if [ $j -ge $start ] && [ $j -lt $i ]
          then
                  count=`echo "$count + 1"|bc`
         fi
 done
cf=`echo "$cf+$count"|bc`
x=`echo "scale=4;($start + $i - 1) / 2"|bc`
cx=`echo "scale=4;$cx + x"|bc`
fx=`echo "scale=4; $x * $count "|bc`
cfx=`echo "scale=4;$cfx+$fx"|bc`
x2=`echo "scale=4;$x^2"|bc`
cx2=`echo "scale=4;$x2+$cx2"|bc`
fx2=`echo "scale=4;$count*$x2"|bc`
cfx2=`echo "scale=4;$cfx2+$fx2"|bc`
start=$i
done
if [ $i -lt $max ]
then
  count=0
    for k in `cat $temp|cut -d ',' -f 1`
            do
            if [ $k -ge $i ] && [ $k -le $max ]
            then
                    count=`echo "$count + 1"|bc`
           fi
   done
cf=`echo "scale=4;$cf+$count"|bc`
x=`echo "scale=4;( $i + $max )/2"|bc`
cx=`echo "scale=4;$cx + x"|bc`
fx=`echo "scale=4;$x * $count"|bc`
cfx=`echo "scale=4;$cfx+$fx"|bc`
x2=`echo "scale=4;$x^2"|bc`
cx2=`echo "scale=4;$x2+$cx2"|bc`
fx2=`echo "scale=4;$count*$x2"|bc`
cfx2=`echo "scale=4;$cfx2+$fx2"|bc`
fi

mean=`echo "scale=4;$cfx/$cf"|bc`
variance=`echo "scale=4;($cfx2/$cf)-($cfx/$cf)^2"|bc`
sd=`echo "scale=4;sqrt($variance)"|bc`

echo "$bha -> $mean -> $variance -> $sd"
rm $temp
done

