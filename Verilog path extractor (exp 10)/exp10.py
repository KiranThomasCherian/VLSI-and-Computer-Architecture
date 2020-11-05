import re
from collections import defaultdict
from collections import OrderedDict

flag=0
def dfspathfind(graph,u,d,visited, path):  
	visited[u]= [True]
	path.append(u)  
	if u == d: 
		if path==[] :
			pass
		else :
			global flag
			flag =1
			print("Path by wire notation : ",end =" ")
			print(path) 
			gatepath=[]
			ftp=open(fname)
			for i in path:
				if i not in interminals  :
					gatepath.append(gateouts[i][0])
				else:
					gatepath.append(i)
					#print(i)
				if i == d :
					gatepath.append(i)
			print("Path by gate notation : ",end =" ")
			print(gatepath)	
	else: 
		for i in graph[u]: 
			if visited[i]== [False]: 
				dfspathfind(graph,i,d, visited, path) 
	path.pop() 
	visited[u]= [False]

def pathfind(graph,allterminals,s,d): 
	#visited =[False]*(len(graph)) 
	visited=defaultdict(list)

	for i in allterminals :
		visited[i].append(False)
	#print(visited)
	path = []  
	dfspathfind(graph,s,d, visited, path)
	del visited 

interminals=[]
outterminals=[]
fname=None
gateouts=defaultdict(list)						#gate names associated the outterminals
if __name__ == "__main__" :
	fname=input("\n\t\t PATH GENERATOR FROM VERILOG FILE \n\n Enter the file name (please use valid name ) : ")
	try :
		fp =open(fname)
	except IOError :
		print("\n\n No such file exist,retry with correct name with .v ending,exiting")
	else:
		gates =['not','and','xor','or','nand','nor','xnor']
		nodes=[]									#last 2 or 1 from ()
		internodes=[]								#first 1 from ()
		graph=defaultdict(list)
		for line in fp :
			for sr in gates :
				if sr in line :
						ss=line[line.index('(')+1:line.index(')')]		#extracting () part
						#print(ss)
						#print(sr)
						internodes.append(((ss.split(','))[0]).strip())
						if sr == "not" :
							nodes.append(((ss.split(','))[1]).strip())
							graph[((ss.split(','))[1]).strip()].append(((ss.split(','))[0]).strip())
						else :
							nodes.append(((ss.split(','))[1]).strip())
							graph[((ss.split(','))[1]).strip()].append(((ss.split(','))[0]).strip())
							nodes.append(((ss.split(','))[2]).strip())
							graph[((ss.split(','))[2]).strip()].append(((ss.split(','))[0]).strip())
						gateouts[((ss.split(','))[0]).strip()].append(line[line.index(sr)+len(sr):line.index('(')])
						break
		

		for a in nodes :
			if a not in internodes :
				interminals.append(a)
		for a in internodes :
			if a not in nodes :
				outterminals.append(a)
		fp.close()
		interminals=list(OrderedDict.fromkeys(interminals))
		outterminals=list(OrderedDict.fromkeys(outterminals))
		allterminals=[]
		allterminals+=list(OrderedDict.fromkeys(nodes))
		allterminals+=list(OrderedDict.fromkeys(internodes))
		allterminals=list(OrderedDict.fromkeys(allterminals))	
		#print(graph)
		print("\nInput Terminals : ",end =" ") 
		print(interminals)
		print("Output Terminals  : ",end =" ")
		print(outterminals)
		#print(allterminals)	
		#print(gateouts.values)	
		#global flag
		for s in interminals :
			for d in outterminals :
				#print(s)
				#print(d)

				flag=0
				print("\n\nPaths between {} and {} :".format(s,d))
				pathfind(graph,allterminals,s,d)
				if (flag == 0):
					print("No direct path")



 


