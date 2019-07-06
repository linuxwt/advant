#!/bin/bash
#########################博客首页封面图片轮换#######################################

a=\"https://img.linuxwt.com/images/2018/10background-cover_.png\"
b=\"https://img.linuxwt.com/f4cb5839-d19a-42db-a1c0-23462f6d2a1a.jpeg\"
c=\"https://img.linuxwt.com/6a104046-57fb-4778-9c1e-22df3961390e.jpeg\"
a1=$(cat /data/blog/ghost/content/themes/yasuko/index.hbs | grep $a | wc -l)
b1=$(cat /data/blog/ghost/content/themes/yasuko/index.hbs | grep $b | wc -l)
c1=$(cat /data/blog/ghost/content/themes/yasuko/index.hbs | grep $c | wc -l)

#sed -i "s/f4cb5839-d19a-42db-a1c0-23462f6d2a1a.jpeg/images\/2018\/10background-cover_.png/g" index.hbs

d=$(cat /data/blog/ghost/content/themes/yasuko/index.hbs | head -n 2 | tail -n 1 | awk  -F ' ' '{print $3}' | cut -d'=' -f2)
case $d in
$a )
[ $a1 -eq 1 ] && sed -i "s/images\/2018\/10background-cover_.png/f4cb5839-d19a-42db-a1c0-23462f6d2a1a.jpeg/g" /data/blog/ghost/content/themes/yasuko/index.hbs
#[ $c1 -eq 1 ] && sed -i "s/6a104046-57fb-4778-9c1e-22df3961390e.jpeg/f4cb5839-d19a-42db-a1c0-23462f6d2a1a.jpeg/g" /data/blog/ghost/content/themes/yasuko/index.hbs
;;
$b ) 
#[ $a1 -eq 1 ] && sed -i "s/\/images\/2018\/10background-cover_.png/6a104046-57fb-4778-9c1e-22df3961390e.jpeg/g" /data/blog/ghost/content/themes/yasuko/index.hbs
[ $b1 -eq 1 ] && sed -i "s/f4cb5839-d19a-42db-a1c0-23462f6d2a1a.jpeg/6a104046-57fb-4778-9c1e-22df3961390e.jpeg/g" /data/blog/ghost/content/themes/yasuko/index.hbs
;;
$c )
#[ $b1 -eq 1 ] && sed -i "s/f4cb5839-d19a-42db-a1c0-23462f6d2a1a.jpeg/images\/2018\/10background-cover_.png/g" /data/blog/ghost/content/themes/yasuko/index.hbs
[ $c1 -eq 1 ] && sed -i "s/6a104046-57fb-4778-9c1e-22df3961390e.jpeg/images\/2018\/10background-cover_.png/g" /data/blog/ghost/content/themes/yasuko/index.hbs
;;
*)
exit -1
;;
esac

docker restart myghost
