const http = require('http')
const mysql = require('mysql')


const hostname = 'localhost'
const port = 3000

const server = http.createServer((req, res) => {

	req.on('data', (d) => {
		var data = JSON.parse(d)
		sql = "SELECT student_id FROM students WHERE student_id = '" + data + "'"
		db.query(sql, (err, result, fields) => {
			if(err) console.log(err)
			res.statusCode = 200
			res.setHeader('Content-Type', 'text/json')
			//result[0].student_id
			if(result.length === 0)
				res.end(JSON.stringify(JSON.stringify(false)))
			else
				res.end(JSON.stringify(JSON.stringify(true)))

			
		})
	})
})


server.listen(port, hostname, () => {
	console.log('Server running on port ' + port)
})


const db = mysql.createConnection({
	host 	 : "localhost",
	user	 : "pbe",
	password : "PBEpasswd",
	database : "db"
})
db.connect()

