### Blog Management > Article List ———— Zeng Yuqing
1. **About Setting Up the Project:**
- 1. Set up the environment by downloading the software: node-v20.18.0-x64 and Navicat 
- 2. In Navicat, create the database egg_cms_development and then import the database data from the original blogger's project root directory, egg_cms_development.sql file
- 3. Open the project in VSC and modify the database name and password in the config/config.default.js file, as well as the host address. 
- 4. In VSC, create a new terminal and run the project with the command npm run dev 
- 5. After successful execution, open the browser to the address http://127.0.0.1:7001/index.html to successfully access the project. The default login account is admin, password: 123456, and you only need to enter the image verification code to access the homepage.