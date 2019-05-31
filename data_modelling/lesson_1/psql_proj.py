import psycopg2
 
def main():

	conn = psycopg2.connect('dbname=udacdataeng user=danielwork')
	cur = conn.cursor()
	cur.execute("create table testtab(id serial PRIMARY KEY,	num integer);")
	conn.commit()
	cur.close()
	conn.close()



if __name__ == '__main__':
		main()
		
