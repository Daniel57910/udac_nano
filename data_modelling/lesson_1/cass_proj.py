
from cassandra.cluster import Cluster
from cassandra import AlreadyExists
from cassandra.query import SimpleStatement

def create_database(session):

		core_keyspace = "CREATE KEYSPACE udac_data_eng_cass	WITH REPLICATION = " 
		keyspace_config = "{ 'class': 'SimpleStrategy', 'replication_factor':  1 }"

		try:
			session.execute(
				core_keyspace + keyspace_config
			)
		except AlreadyExists:
			pass

def create_table(session):

		core_tab = "CREATE TABLE IF NOT EXISTS "
		tab_config = "songs (song_title text PRIMARY KEY, artist_name text, year int, album_name text, single Boolean)"
		query = core_tab + tab_config

		try:
			session.execute(
				query
			)
		except AlreadyExists:
			pass

def insert_data(session, data):

	core_insert = "insert into songs "
	columns = "(song_title, artist_name, year, album_name, single) VALUES (?, ?, ?, ?, ?)"
	query = session.prepare(core_insert + columns)

	try:
		session.execute(
			session.execute(query, data)
		)
	except AttributeError as e:
		print(e)
		pass

def exec_query(session, query):

		try:
			rows = session.execute(query)
			return rows
		except Exception as e:
			print(e)
		
def main():

	cluster = Cluster(['127.0.0.1'])
	session = cluster.connect()
	create_database(session)
	session.set_keyspace("udac_data_eng_cass")
	create_table(session)

	data1 = ["Let it Be", "The Beatles", 1970, "Across The Universe", False]
	data2 = ["Think For Yourself", "The Beatles", 1965, "Rubber Soul", False]

	insert_data(session, data1)
	insert_data(session, data2)

	all_rows = exec_query(session, 'select * from songs')
	rows_age = exec_query(session, 'select * from songs where year = 1970 ALLOW FILTERING')

	for r in all_rows:
		print(r.artist_name, r.album_name, r.year)
	
	for r in rows_age:
		print(r.artist_name, r.album_name, r.year)

	session.shutdown()
	cluster.shutdown()


if __name__ == '__main__':
		main()
		