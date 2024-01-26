// Import the 'http' module
const fs = require('fs');
const xlsx = require('xlsx');
const express = require('express');
const dotenv = require('dotenv').config();
const multer  = require('multer');
const bodyParser = require('body-parser')
const mysql = require('mysql');
const path = require('path');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const authenticateToken = require('./middleware/authenticateToken');

const app = express();

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'practitioner'
});
  
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL as ID ' + connection.threadId);
});

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*"); // Replace with the actual origin of your frontend
    res.header("Access-Control-Allow-Headers", "*");
    next();
});

app.use(bodyParser.json())

app.get('/all', authenticateToken, (req, res) => {
    var data = [];
    connection.query('SELECT * FROM practitioner_list', (error, results, fields) => {
        if (error) throw error;
        data = JSON.stringify(results)
        res.json(results);
    });
    
    // Send the data as a JSON response
});

app.get('/data', (req, res) => {
    var data = [];
    connection.query('SELECT * FROM practitioner_list WHERE status = ?', ['active'], (error, results, fields) => {
        if (error) throw error;
        data = JSON.stringify(results)
        res.json(results);
    });
    
    // Send the data as a JSON response
});

app.get('/metaData', (req, res) => {
    var data = [];
    connection.query('SELECT * FROM practitioner_list', (error, results, fields) => {
        if (error) throw error;
        var specs = [];
        var tags = [];
        data = JSON.stringify(results)
        results.forEach(element => {
            if(element.specialty != '') {
                specArray = element.specialty.split(',');
                specArray.forEach(subElement => {
                    var value;
                    if(subElement.charAt(0) == ' ') {
                        value = subElement.substring(1);
                    } else {
                        value = subElement;
                    }
                    if(specs.indexOf(value) == -1) {
                        specs.push(value);
                    }
                });
            }
            if(element.specialty != '') {
                tagArray = element.tags.split(',');
                tagArray.forEach(subElement => {
                    var value;
                    if(subElement.charAt(0) == ' ') {
                        value = subElement.substring(1);
                    } else {
                        value = subElement;
                    }
                    if(tags.indexOf(value) == -1) {
                        tags.push(value);
                    }
                });
            }
        });
        data = {
            tags: tags,
            specs: specs
        };
        res.json(data);
    });
    
    // Send the data as a JSON response
});

app.post('/new', (req, res) => {
    var newData = req.body;
    connection.query('Select * FROM practitioner_list WHERE email = ?', [newData.email], (error, results, fields) => {
        if (error) throw error;
        if(results.length > 0) {
            res.json('duplicated');
        } else {
            connection.query('INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [newData.firstname, newData.lastname, newData.specialty, newData.imageURL, newData.uploaded, newData.tags, newData.meetingLink, newData.address, newData.city, newData.state, newData.zipcode, newData.country, newData.email, newData.phone], (error, results, fields) => {
                if (error) throw error;
                console.log('Inserted a new row with ID:', results.insertId);
                res.json('success');
            });
        }
    });
});

app.post('/update', (req, res) => {
    var newData = req.body;
    // Update operation
    const updateQuery = 'UPDATE practitioner_list SET firstname = ?, lastname = ?, specialty = ?, imageURL = ?, tags = ?, meetingLink = ?, address = ?, city = ?, zipcode = ?, state = ?, phone = ?, rank = ?, review = ?, email = ?, country = ?, status = ? WHERE id = ?';
    const updateValues = [newData.firstname, newData.lastname, newData.specialty, newData.imageURL, newData.tags, newData.meetingLink, newData.address, newData.city, newData.zipcode, newData.state, newData.phone, newData.rank, newData.review, newData.email, newData.country, newData.status, newData.id]; // Replace with actual values

    connection.query(updateQuery, updateValues, (error, results, fields) => {
        if (error) throw error;
        console.log('Updated rows:', results.affectedRows);
        res.json('success');
    });
});

app.post('/updateDB', async (req, res) => {
    var newData = req.body;
    await connection.query('DELETE FROM practitioner_list', (error, results, fields) => {})

    // Add Admin
    await connection.query('INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone, rank, review, status, role, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', ['Nima', 'Farshid', 'Bio-Well practitioner, Reiki Master, Sound Healer, Meditation Coach', 'https://biohackingcongress.com/storage/users/June2023/9Q67Ebbs5rPLWWmWGZET.png', 0 , 'Reiki, biowell, soundhealer, meditation', 'https://calendly.com/nimafarshid/biowell', '11532 Via Lucerna Cir', 'Windermere', 'FL', '34786', 'US', 'nima02@yahoo.com', '407-230-8179', 3, 5, 'active', 0, '$2b$10$WZ9pp7nsSEcgglZD8W8oueFvDfSDKKY1VJ.wVWRGRKubqDlowH2UG'], (error, results, fields) => {
        if (error) throw error;
    });

    console.log(newData);
    // Add users
    newData.forEach(async (element, index) => {
        if(element['Email'] != 'nima02@yahoo.com' && index != 0) {
            await connection.query('INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [element['First Name'], element['Last Name'], element['Specialty'], element['ImageURL'], 0, element['Tags'], element['MeetingLink'], element['Address'], element['City'], element['State'], element['Zipcode'], element['Country'], element['Email'], element['Phone']], (error, results, fields) => {
                if (error) throw error;
            });
        }
    });

    res.json('success');
    // Update operation
    // const updateQuery = 'UPDATE practitioner_list SET firstname = ?, lastname = ?, specialty = ?, imageURL = ?, tags = ?, meetingLink = ?, address = ?, city = ?, zipcode = ?, state = ?, phone = ?, rank = ?, review = ?, email = ?, country = ?, status = ? WHERE id = ?';
    // const updateValues = [newData.firstname, newData.lastname, newData.specialty, newData.imageURL, newData.tags, newData.meetingLink, newData.address, newData.city, newData.zipcode, newData.state, newData.phone, newData.rank, newData.review, newData.email, newData.country, newData.status, newData.id]; // Replace with actual values

    // connection.query(updateQuery, updateValues, (error, results, fields) => {
    //     if (error) throw error;
    //     console.log('Updated rows:', results.affectedRows);
    //     res.json('success');
    // });
});

app.post('/user', (req, res) => {
    var newData = req.body;
    // Update operation
    var newData = req.body;
    connection.query('Select * FROM practitioner_list WHERE id = ?', [newData.id], (error, results, fields) => {
        if (error) throw error;
        res.json(results);
    });
});

app.post('/remove', (req, res) => {
    var newData = req.body;
    // Update operation
    connection.query('DELETE FROM practitioner_list WHERE id = ?', [newData.id], (error, results, fields) => {
        if (error) throw error;
        console.log('Deleted rows:', results.affectedRows);
        res.json('success');
    });
});

app.post('/login', async (req, res) => {
    const newData = req.body;
    console.log(await bcrypt.hash('Pass1234!', 10));
    // $2b$10$WZ9pp7nsSEcgglZD8W8oueFvDfSDKKY1VJ.wVWRGRKubqDlowH2UG
    try {
        const query = 'SELECT * FROM practitioner_list WHERE email = ?';
        connection.query(query, [newData.email], async(error, results, fields) => {
            if (error) throw error;
            
            user = results;
            console.log(results);

            if (user.length === 0) {
                return res.status(401).json({ message: 'Invalid credentials.' });
            }

            const passwordMatch = await bcrypt.compare(newData.password, user[0].password);
    
            if (!passwordMatch) {
                console.log('bbb');
                return res.status(401).json({ message: 'Invalid credentials.' });
            }
    
            const token = jwt.sign({ username: user[0].firstname + user[0].lastname, userId: user[0].id }, process.env.JWT_SECRET, { expiresIn: '1h' });
    
            res.json({ token });
        });
    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ message: 'Internal server error.' });
    }
});

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'src/')
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})
const upload = multer({ storage: storage })
// Define the route to handle the file upload
app.post('/media', upload.single('image'), function (req, res, next) {
  
    // Send a response back to the frontend
    if (req.file) {
        res.send(req.file.filename);
    } else {
        res.status(400).send('File upload failed');
    }
})
  
app.use('/src', express.static(__dirname + '/src'));

app.use(async (req, res, next) => {
    const token = req.header('Authorization');
    if (token) {
        try {
            const [rows, fields] = await db.execute('INSERT INTO tokens (token) VALUES (?)', [token]);
            console.log('Token saved to the database:', token);
        } catch (error) {
            console.error('Error saving token to the database:', error.message);
        }
    }
    next();
});

app.listen(3000, () => {
    console.log('Server running at http://localhost:3000/');
});