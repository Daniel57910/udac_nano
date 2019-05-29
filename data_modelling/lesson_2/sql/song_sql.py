import psycopg2

def main():
	
	conn = psycopg2.connect('dbname=udacdataeng user=danielwork')
	cur = conn.cursor()


if __name__ == "__main__":
		main()