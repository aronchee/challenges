# Paste the 3 schemas and all your queries here.
Query to extract voting data
1. Count the votes for Sen. Olympia Snowe, whose id is 524.

sqlite> select count(id) from votes
   ...> where politician_id='524';
count(id) 
----------
23  

2. do that query with a JOIN statement without hard-coding the id 524 explicitly, 
	querying both the votes and congress_members table.

sqlite> select count(congress_members.id) from votes
   ...> join congress_members
   ...> on congress_members.id=votes.politician_id
   ...> where congress_members.name='%Olympia%';
count(congress_members.id)
--------------------------
23                        

3.how about the Rep.Erik Paulsen? how many votes did he get?

sqlite> select count(congress_members.id) from votes
   ...> join congress_members
   ...> on congress_members.id=votes.politician_id
   ...> where congress_members.name like '%Erik Paulsen%';
count(congress_members.id)
--------------------------
21

4.make a list of congress_members that got the most votes, in decending order
exclude create_at and updated columns

sqlite> select congress_members.id, congress_members.name,congress_members.party, count(*) from congress_members
   ...> join votes
   ...> on congress_members.id=votes.politician_id
   ...> group by votes.politician_id
   ...> order by count(politician_id) desc;
id          name               party       count(*)  
----------  -----------------  ----------  ----------
224         Rep. Dan Benishek  R           32        
302         Rep. Tammy Baldwi  D           31        
336         Rep. Dale Kildee   D           31        
471         Rep. Jim Costa     D           31        
472         Rep. Frank Pallon  D           31        
481         Sen. Maria Cantwe  D           30        
201         Rep. Marcia Fudge  D           29        
323         Rep. Ruben Hinojo  D           29        
10          Sen. Ron Johnson   R           28        
67          Rep. Scott DesJar  R           28        
169         Rep. Devin Nunes   R           28        
318         Rep. Tom Latham    R           28        
330         Rep. Zoe Lofgren   D           28        
335         Sen. Jerry Moran   R           28        
455         Sen. Kay Hagan     D           28        
457         Rep. Henry Cuella  D           28        
515         Sen. Joseph Liebe  I           28        
19          Rep. Paul Gosar    R           27        
69          Sen. John Barrass  R           27        
196         Rep. Kevin McCart  R           27        
266         Rep. Louise Slaug  D           27        
358         Rep. Gary Ackerma  D           27        
442         Sen. Mark Warner   D           27        
469         Rep. Stephen Finc  R           27        
87          Rep. Patrick McHe  R           26        
98          Sen. Lamar Alexan  R           26        
130         Rep. Joe Barton    R           26        
139         Rep. Scott Rigell  R           26        
152         Rep. John Barrow   D           26        
156         Rep. Rob Bishop    R           26        
186         Rep. Jim McGovern  D           26        
232         Rep. Chris Murphy  D           26        
250         Rep. Sam Farr      D           26        
251         Rep. Randy Hultgr  R           26                   
.......     
76          Rep. Tim Walz      D           12        
135         Rep. Joe Pitts     R           12        
191         Rep. C. W. Bill Y  R           12        
195         Sen. Mitch McConn  R           12        
209         Rep. Raul Labrado  R           12        
290         Rep. Jerry McNern  D           12        
370         Rep. Jerry Lewis   R           12        
381         Rep. Karen Bass    D           12        
465         Rep. Chris Van Ho  D           12        
476         Rep. David Price   D           12        
490         Sen. Richard Shel  R           12        
523         Rep. Rodney Alexa  R           12        
122         Rep. Steven LaTou  R           11        
158         Rep. Frank Guinta  R           11        
213         Sen. Sheldon Whit  D           11        
221         Rep. David McKinl  R           11        
222         Rep. Lee Terry     R           11        
272         Rep. Gene Green    D           11        
315         Rep. Randy Forbes  R           11        
433         Rep. Rodney Freli  R           11        
181         Rep. John Kline    R           10        
291         Rep. Steven Guthr  R           10        
296         Sen. Orrin Hatch   R           10        
352         Rep. Heath Shuler  D           10        
380         Rep. Doris Matsui  D           10        
470         Rep. Betty McColl  D           10        
92          Rep. Alan Nunnele  R           9         
99          Rep. Robert Dold   R           9         
88          Rep. Tim Huelskam  R           8         
506         Rep. Ileana Ros-L  R           8         
32          Rep. Bill Cassidy  R           7         
520         Rep. Jim Sensenbr  R           7         
461         Rep. Mike Rogers   R           6

5. make a list of congress_members with the least number of votes, ascending order
skip, datetime columns

sqlite> select congress_members.id, congress_members.name,congress_members.party, count(*) from congress_members
   ...> join votes
   ...> on congress_members.id=votes.politician_id
   ...> group by votes.politician_id
   ...> order by count(politician_id) asc;
id          name              party       count(*)  
----------  ----------------  ----------  ----------
461         Rep. Mike Rogers  R           6         
32          Rep. Bill Cassid  R           7         
520         Rep. Jim Sensenb  R           7         
88          Rep. Tim Huelska  R           8         
506         Rep. Ileana Ros-  R           8         
92          Rep. Alan Nunnel  R           9         
99          Rep. Robert Dold  R           9         
181         Rep. John Kline   R           10        
291         Rep. Steven Guth  R           10        
296         Sen. Orrin Hatch  R           10        
352         Rep. Heath Shule  D           10        
380         Rep. Doris Matsu  D           10        
470         Rep. Betty McCol  D           10        
122         Rep. Steven LaTo  R           11        
158         Rep. Frank Guint  R           11        
213         Sen. Sheldon Whi  D           11        
221         Rep. David McKin  R           11        
222         Rep. Lee Terry    R           11        
272         Rep. Gene Green   D           11        
315         Rep. Randy Forbe  R           11        
433         Rep. Rodney Frel  R           11        
4           Rep. Sean Duffy   R           12        
46          Rep. Lynn Westmo  R           12        
60          Rep. John Carney  D           12        
76          Rep. Tim Walz     D           12        
135         Rep. Joe Pitts    R           12        
191         Rep. C. W. Bill   R           12        
195         Sen. Mitch McCon  R           12        
209         Rep. Raul Labrad  R           12        
290         Rep. Jerry McNer  D           12        
370         Rep. Jerry Lewis  R           12        
381         Rep. Karen Bass   D           12        
465         Rep. Chris Van H  D           12            
....    
255         Rep. Richard Nea  D           26        
282         Rep. Cliff Stear  R           26        
289         Rep. Jared Polis  D           26        
295         Rep. Shelley Cap  R           26        
359         Rep. Ben Chandle  D           26        
384         Rep. Mike McInty  D           26        
19          Rep. Paul Gosar   R           27        
69          Sen. John Barras  R           27        
196         Rep. Kevin McCar  R           27        
266         Rep. Louise Slau  D           27        
358         Rep. Gary Ackerm  D           27        
442         Sen. Mark Warner  D           27        
469         Rep. Stephen Fin  R           27        
10          Sen. Ron Johnson  R           28        
67          Rep. Scott DesJa  R           28        
169         Rep. Devin Nunes  R           28        
318         Rep. Tom Latham   R           28        
330         Rep. Zoe Lofgren  D           28        
335         Sen. Jerry Moran  R           28        
455         Sen. Kay Hagan    D           28        
457         Rep. Henry Cuell  D           28        
515         Sen. Joseph Lieb  I           28        
201         Rep. Marcia Fudg  D           29        
323         Rep. Ruben Hinoj  D           29        
481         Sen. Maria Cantw  D           30        
302         Rep. Tammy Baldw  D           31        
336         Rep. Dale Kildee  D           31        
471         Rep. Jim Costa    D           31        
472         Rep. Frank Pallo  D           31        
224         Rep. Dan Benishe  R           32 

Advanced queries to expose voter fraud
1. which congress member receivedn the most votes? list their name and count
of their vote. who were the people that voted for that politician?
list their names, gender, and party.

sqlite> select congress_members.id, congress_members.name,congress_members.party, count(*) from congress_members
   ...> join votes
   ...> on congress_members.id=votes.politician_id
   ...> group by votes.politician_id
   ...> order by count(politician_id) desc limit 1; #limit 1 = only show the no.1 position.
id          name               party       count(*)  
----------  -----------------  ----------  ----------
224         Rep. Dan Benishek  R           32

sqlite> select voters.first_name, voters.last_name, voters.gender, congress_members.name, count(congress_members.id) from votes
   ...> join congress_members
   ...> on congress_members.id=votes.politician_id
   ...> join voters
   ...> on voters.id=votes.voter_id
   ...> where congress_members.id='224'
   ...> group by voters.id;
first_name  last_name   gender      name               count(congress_members.id)
----------  ----------  ----------  -----------------  --------------------------
Roberta     Hahn        male        Rep. Dan Benishek  1                         
Damien      Daugherty   female      Rep. Dan Benishek  1                         
Jedediah    Emard       female      Rep. Dan Benishek  1                         
Bryon       Kuhn        female      Rep. Dan Benishek  1                         
Mariane     Becker      male        Rep. Dan Benishek  1                         
Reanna      Homenick    male        Rep. Dan Benishek  1                         
Augusta     Turner      female      Rep. Dan Benishek  1                         
Ashly       Davis       female      Rep. Dan Benishek  1                         
Thurman     Hills       female      Rep. Dan Benishek  1                         
Dax         Quitzon     female      Rep. Dan Benishek  1                         
Arden       Crist       female      Rep. Dan Benishek  1                         
Heloise     Schowalter  female      Rep. Dan Benishek  1                         
Halie       Barton      female      Rep. Dan Benishek  1                         
River       Jaskolski   female      Rep. Dan Benishek  1                         
Theodore    Ferry       female      Rep. Dan Benishek  1                         
Elliott     Sawayn      male        Rep. Dan Benishek  1                         
Reed        Schneider   male        Rep. Dan Benishek  1                         
Sylvester   Wilderman   male        Rep. Dan Benishek  1                         
Korbin      Jakubowski  female      Rep. Dan Benishek  1                         
Royce       Bogisich    male        Rep. Dan Benishek  1                         
Valentina   Wyman       female      Rep. Dan Benishek  1                         
Kamren      Beahan      female      Rep. Dan Benishek  1                         
Frederique  Schuppe     male        Rep. Dan Benishek  1                         
Watson      Mueller     female      Rep. Dan Benishek  1                         
Brycen      Cole        male        Rep. Dan Benishek  1                         
Hobart      Tromp       male        Rep. Dan Benishek  1                         
Uriel       Pacocha     male        Rep. Dan Benishek  1                         
Sydni       Balistreri  male        Rep. Dan Benishek  1                         
Merl        Marquardt   male        Rep. Dan Benishek  1                         
Emily       Satterfiel  female      Rep. Dan Benishek  1                         
Althea      Bergnaum    female      Rep. Dan Benishek  1                         
Julio       Murazik     female      Rep. Dan Benishek  1

2.how many votes were received by congress members whose communication grade
average was less than 9(grade_current)? List their name, location, grade since
1996, and the vote count.

sqlite> select congress_members.name, congress_members.location, round(congress_members.grade_1996, 2), count(*) from congress_members
   ...> join votes
   ...> on congress_members.id=votes.politician_id
   ...> where congress_members.grade_current < 9
   ...> group by congress_members.id;
name                location    round(congress_members.grade_1996, 2)  count(*)  
------------------  ----------  -------------------------------------  ----------
Rep. Mick Mulvaney  SC          7.95                                   15        
Rep. Rob Woodall    GA          8.02                                   23        
Sen. Rand Paul      KY          8.04                                   14        
Rep. Sean Duffy     WI          8.09                                   12        
Rep. Tim Griffin    AR          8.13                                   20        
Rep. W. Todd Akin   MO          8.14                                   23        
Rep. Vicky Hartzle  MO          8.44                                   20        
Rep. Tom Graves     GA          8.6                                    21        
Rep. David Schweik  AZ          8.61                                   17        
Sen. Ron Johnson    WI          8.62                                   28        
Rep. Phil Roe       TN          8.64                                   19        
Rep. Jeff Landry    LA          8.64                                   16        
Rep. John Campbell  CA          8.87                                   18        
Rep. Joe Walsh      IL          8.91                                   17        
Rep. John Garamend  CA          8.92                                   18        
Rep. Roscoe Bartle  MD          8.93                                   20        
Rep. John Lewis     GA          8.94                                   22        
Rep. Adam Kinzinge  IL          9.0                                    18        
Rep. Jeff Flake     AZ          9.14                                   23        
Rep. Jack Kingston  GA          9.25                                   18        
Rep. Keith Ellison  MN          9.3                                    19        
Rep. Jason Chaffet  UT          9.34                                   23        
Sen. Jeff Sessions  AL          9.35                                   23        
Sen. Barbara Boxer  CA          9.41                                   14        
Rep. Ted Poe        TX          9.66                                   15        
Sen. Barbara Mikul  MD          9.81                                   16        
Rep. Peter DeFazio  OR          9.83                                   21        
Sen. Jim Inhofe     OK          10.11                                  13        
Rep. Steve Pearce   NM          10.41                                  15        
Rep. Collin Peters  MN          10.42                                  19        
Sen. Frank Lautenb  NJ          10.47                                  17        
Rep. Spencer Bachu  AL          10.6                                   14        
Rep. Ander Crensha  FL          11.23                                  23        
Rep. Connie Mack    FL          12.04                                  14        
Rep. Don Young      AK          12.34                                  13 

3.what 10 states had the most voters turnout?(Does this correspond to population of those state?)
list the people that voted in the top states elections. 

sqlite> SELECT congress_members.name, congress_members.location, COUNT(*) FROM congress_members
   ...> join votes
   ...> on congress_members.id=votes.politician_id
   ...> group by congress_members.location
   ...> order by count(*) desc limit 10;
name               location    COUNT(*)  
-----------------  ----------  ----------
Rep. Lynn Woolsey  CA          1025      
Rep. Henry Cuella  TX          643       
Sen. Chuck Schume  NY          582       
Rep. Ileana Ros-L  FL          497       
Rep. Mark Critz    PA          400       
Rep. Bobby Schill  IL          395       
Rep. Betty Sutton  OH          380       
Rep. Dan Benishek  MI          333       
Rep. David Price   NC          297       
Rep. John Barrow   GA          296

4.list of people voted more than 2 times? 

sqlite> select voters.id, voters.first_name, voters.last_name, count(votes.id) from voters
   ...> join votes
   ...> on votes.voter_id=voters.id
   ...> group by voters.id
   ...> having count(votes.id) > 2 limit 20;
id          first_name  last_name   count(votes.id)
----------  ----------  ----------  ---------------
1           Aiden       Kuhlman     3              
5           Marshall    Osinski     3              
11          Carmine     Ankunding   3              
14          Caden       Greenfelde  4              
17          Luz         Collins     4              
18          Elenor      Davis       3              
20          Norval      Hilpert     3              
22          Alexzander  Hickle      3              
26          Geo         Christians  3              
28          Verla       Ondricka    5              
30          Darryl      Mosciski    3              
37          Anya        Wilderman   3              
39          Braxton     Cronin      3              
43          Kaitlin     Klein       4              
44          Lacy        Dickinson   4              
48          Demetris    Schmitt     4              
50          Corene      Marvin      3              
51          Clyde       Fritsch     3              
52          Christ      Cole        3              
55          Roman       Murphy      3              
62          Ephraim     Osinski     4                         
....

5.did anyone vote same politician twice? what was the name of the voter and the politician
they voted for??

sqlite> select voters.id, voters.first_name, voters.last_name, congress_members.name, count(votes.id) as count
   ...> from voters
   ...> join votes
   ...> on votes.voter_id=voters.id
   ...> join congress_members
   ...> on congress_members.id=votes.politician_id
   ...> group by voters.id
   ...> having count > 1 limit 20;
id          first_name  last_name   name                 count     
----------  ----------  ----------  -------------------  ----------
1           Aiden       Kuhlman     Rep. Candice Miller  3         
2           Afton       Fritsch     Rep. Mike Ross       2         
5           Marshall    Osinski     Rep. Mary Bono Mack  3         
9           Wilfred     Jacobson    Rep. Judy Biggert    2         
10          Stanton     Pfannersti  Rep. Pete King       2         
11          Carmine     Ankunding   Sen. Carl Levin      3         
12          Beulah      Heaney      Sen. Tom Harkin      2         
14          Caden       Greenfelde  Sen. Mike Crapo      4         
16          Kamryn      Littel      Rep. Richard Nugent  2         
17          Luz         Collins     Sen. Thad Cochran    4         
18          Elenor      Davis       Sen. Tom Carper      3         
20          Norval      Hilpert     Sen. Jon Tester      3         
22          Alexzander  Hickle      Rep. Jack Kingston   3         
24          Jamil       Schmitt     Rep. Geoff Davis     2         
26          Geo         Christians  Rep. Ed Whitfield    3         
28          Verla       Ondricka    Rep. Frank Wolf      5         
30          Darryl      Mosciski    Rep. Allyson Schwar  3         
31          Isac        Crist       Rep. Frank Wolf      2         
32          Otis        Hyatt       Rep. Hank Johnson    2         
34          Renee       Jerde       Rep. Charles Dent    2