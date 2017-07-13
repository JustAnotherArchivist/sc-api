import wpull.database.sqltable


# From ludios's grab-site, libgrabsite/plugin.py, commit 7a63a3dc
class NoFsyncSQLTable(wpull.database.sqltable.SQLiteURLTable):
	@classmethod
	def _apply_pragmas_callback(cls, connection, record):
		super()._apply_pragmas_callback(connection, record)
		print('Applying PRAGMA')
		connection.execute('PRAGMA synchronous=OFF')


wpull_plugin.factory.class_map['URLTableImplementation'] = NoFsyncSQLTable
