#!/usr/bin/env sh
#
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
if [ "$VSCODE_WSL_DEBUG_INFO" = true ]; then
	set -x
fi

COMMIT="7c6fdfb0b8f2f675eb0b47f3d95eeca78962565b"
APP_NAME="code"
QUALITY="stable"
NAME="Code"
SERVERDATAFOLDER=".vscode-server"
VSCODE_PATH="$(dirname "$(dirname "$(realpath "$0")")")"
ELECTRON="$VSCODE_PATH/$NAME.exe"

IN_WSL=false
if [ -n "$WSL_DISTRO_NAME" ]; then
	# $WSL_DISTRO_NAME is available since WSL builds 18362, also for WSL2
	IN_WSL=true
else
	WSL_BUILD=$(uname -r | sed -E 's/^[0-9.]+-([0-9]+)-Microsoft.*|.*/\1/')
	if [ -n "$WSL_BUILD" ]; then
		if [ "$WSL_BUILD" -ge 17063 ]; then
			# WSLPATH is available since WSL build 17046
			# WSLENV is available since WSL build 17063
			IN_WSL=true
		else
			# If running under older WSL, don't pass cli.js to Electron as
			# environment vars cannot be transferred from WSL to Windows
			# See: https://github.com/microsoft/BashOnWindows/issues/1363
			#      https://github.com/microsoft/BashOnWindows/issues/1494
			"$ELECTRON" "$@"
			exit $?
		fi
	fi
fi
if [ $IN_WSL = true ]; then

	export WSLENV="ELECTRON_RUN_AS_NODE/w:$WSLENV"
	CLI=$(wslpath -m "$VSCODE_PATH/resources/app/out/cli.js")

	# use the Remote WSL extension if installed
	WSL_EXT_ID="ms-vscode-remote.remote-wsl"

	ELECTRON_RUN_AS_NODE=1 "$ELECTRON" "$CLI" --locate-extension $WSL_EXT_ID >/tmp/remote-wsl-loc.txt 2>/dev/null </dev/null
	WSL_EXT_WLOC=$(cat /tmp/remote-wsl-loc.txt)

	if [ -n "$WSL_EXT_WLOC" ]; then
		# replace \r\n with \n in WSL_EXT_WLOC
		WSL_CODE=$(wslpath -u "${WSL_EXT_WLOC%%[[:cntrl:]]}")/scripts/wslCode.sh
		"$WSL_CODE" "$COMMIT" "$QUALITY" "$ELECTRON" "$APP_NAME" "$SERVERDATAFOLDER" "$@"
		exit $?
	fi

elif [ -x "$(command -v cygpath)" ]; then
	CLI=$(cygpath -m "$VSCODE_PATH/resources/app/out/cli.js")
else
	CLI="$VSCODE_PATH/resources/app/out/cli.js"
fi
ELECTRON_RUN_AS_NODE=1 "$ELECTRON" "$CLI" "$@"
exit $?













1.mysql -u root -p
2.create database ecommerce;
3.use ecommerce;
4.CREATE TABLE sales_data (year INT, month VARCHAR(20), category VARCHAR(20), region VARCHAR(20), units_sold INT, revenue FLOAT, profit FLOAT, customer_rating FLOAT, ad_spend FLOAT);

5.SET GLOBAL local_infile = 1;
6.exit
7.mysql --local-infile=1 -u root -p
8. USE ecommerce;
9.LOAD DATA LOCAL INFILE 'P:/Elavate Labs/Task 3/ecommerce_sales.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
10.SELECT * FROM sales_data LIMIT 10;
11.select * from Sales_data
    -> where year=2022
-> ;

12. select * from sales_data  where units_sold > 400 limit 10;
13.select * from sales_data  where category='fashion' order by revenue limit 15;
14. select sum(revenue) as revenue from sales_data group by category order by revenue asc limit 25;
15. select AVG(customer_rating) as Avg_rating from sales_data group by category ;
16.select month from sales_data order by profit limit 3;
17. select sum(units_sold) from sales_data group by year order by year;
18.select sum(profit) from sales_data;
19. select * from sales_data limit 5;
20. select avg(ad_spend) from sales_data group by category;
21. select region , min(units_sold) from sales_data group by region ;
22.select category , count(*)from sales_data group by category;
23.select year , avg(profit) as avg_profit from sales_data group by year order by avg_profit desc;
24.select year , avg(customer_rating) as avg_rating from sales_data group by year;

25.create table region_info ( region varchar(20) , region_head varchar(20));
26. insert into region_info values ('East','Elish') , ('West' , 'Wardmort') , ('North','Nori') , ('South' , 'Siddhi');
27.select * from region_info;
28.select * from sales_data left join region_info  on sales_data.region = region_info.region  limit 40;
29.select r.region ,r.region_head , sum(s.revenue) as total_revenue from sales_data s right join region_info r on r.region=s.region group by r.region_head,r.region ;
30.select r.region ,r.region_head , sum(s.revenue) as total_revenue from sales_data s right join region_info r on r.region=s.region group by r.region_head,r.region ;
31.select * from sales_data where revenue  > (select avg(revenue) from sales_data );
32.mysql> select region from sales_data where profit = ( select max(profit) from sales_data ) limit 1;
33. select region from sales_data  group by region  having sum(ad_spend)  >  sum(revenue) ;
34. select month from sales_data where month= ( select max(revenue) from sales_data where month=( select max(revenue) from sales_data )) ;

35. create view  revenue_per_region as   select region , sum(revenue) as total_revenue from sales_data group by region ;
36.select * from revenue_per_region ;
37. create view revenue_per_category as select sum(revenue) as revenue from sales_data group by category order by revenue asc;
38.select * from revenue_per_category ;
39. CREATE INDEX idx_region_info_region ON region_info(region);
40.SHOW INDEXES FROM region_info;
41. create index idx_region on sales_data(region);
42. show index from sales_data ;
43. EXPLAIN SELECT * FROM sales_data WHERE region = 'West';