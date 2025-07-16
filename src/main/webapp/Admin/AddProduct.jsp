<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Shoe Factory</title>
    
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;900&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        header {
            width: 100%;
            padding: 15px 5%;
            background: linear-gradient(90deg, #000, #555);
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 99;
        }
        
        .logo {
            font-size: clamp(18px, 2vw, 25px);
            color: #ffffff;
            text-decoration: none;
            font-weight: 600;
        }
        
        button {
            padding: 10px 20px;
            color: #000000;
            font-weight: 500;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }
        #btn:hover {
            transform: scale(1.1);
        }
        
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(90deg, #e2e2e2, #c9d6ff);
            padding: 20px;
        }
        
        .container {
            border-radius: 8px;
            background: white;
            padding: 20px;
            max-width: 500px;
            width: 100%;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
        }
        
        form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        h2 {
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 24px;
            color: #000000;
        }

        .input-box {
            width: 100%;
            margin-bottom: 15px;
            margin-top: 10px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #e0d6d6;
            border-radius: 5px;
            background: #ffffff;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #090909;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            font-weight: 600;
            text-align: center;
            color: white;
            background: linear-gradient(90deg, #000, #333);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition:  0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(90deg, #333, #000);
        }

        footer {
            width: 100%;
            padding: 10px;
            text-align: left;
            background: linear-gradient(90deg, #000, #555);
            color: white;
        }
    </style>
</head>

<body>

    <header>
        <a href="#" class="logo">Shoe Factory</a>
         <a href="Admin.jsp">
           <button>Home</button>
        </a>
    </header>

    <main>
        <div class="container">
            <form action="addproduct" name="AddProduct" method="post" enctype="multipart/form-data">
                <h2>Add Product</h2>

                <div class="input-box">
                    <input type="text" name="ProductName" placeholder="Product Name / Brand" required>
                </div>

                <div class="input-box">
                    <input type="text" name="Description" placeholder="Description" required>
                </div>

                <div class="input-box">
                    <select name="Category">
                        <option value="Select">Select Category</option>
                        <option value="Sports">Sports</option>
                        <option value="Casual">Casual</option>
                        <option value="Formal">Formal</option>
                    </select>
                </div>

                <div class="input-box">
                    <input type="number" name="Price" placeholder="Price" required>
                </div>

                <div class="input-box" id="activeinactive">
                    <select name="Status">
                        <option value="Select">Select Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>

                <div class="input-box">
                    <input type="file" name="Image" accept="image/*" required>
                </div>

                <button type="submit" class="btn">Add</button>
            </form>
        </div>
    </main>

    <footer>
        <p>@shoe factory</p>
    </footer>

</body>
</html>
