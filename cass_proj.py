
from cassandra.cluster import Cluster
from cassandra import AlreadyExists

def main():

	cluster = Cluster(['127.0.0.1'])
	session = cluster.connect()

	try:
		session.execute(
			"CREATE KEYSPACE udac_data_eng_cass	WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor':  1 }"
		)
	except AlreadyExists:
		pass

if __name__ == '__main__':
		main()
		