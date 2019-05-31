import psycopg2

def main():

	conn = psycopg2.connect('dbname=udacdataeng user=danielwork')
	cur = conn.cursor()

	core_create_table = "CREATE TABLE [IF NOT EXISTS] tCust (cust_id SERIAL, )"


if __name__ == "__main__":
		main()