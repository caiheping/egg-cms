### Blog Management > Article List ———— Zeng Yuqing
**I.About Setting Up the Project:**
- 1. Set up the environment by downloading the software: node-v20.18.0-x64 and Navicat 
- 2. In Navicat, create the database egg_cms_development and then import the database data from the original blogger's project root directory, egg_cms_development.sql file
- 3. Open the project in VSC and modify the database name and password in the config/config.default.js file, as well as the host address. 
- 4. In VSC, create a new terminal and run the project with the command npm run dev 
- 5. After successful execution, open the browser to the address http://127.0.0.1:7001/index.html to successfully access the project. The default login account is admin, password: 123456, and you only need to enter the image verification code to access the homepage.

**II: Introduction to the Blog Management > Article List Function:**
![Article List Page](images/ariticle%20page.png)
Here is a guide on how to use the article list page:
1. **View Article List**: 
- Open the article list page, and users can see all published articles.
2. **Paginated Browsing**:   
- If there are many articles, you can use the pagination controls at the bottom of the page to browse articles on different pages.

### Search for Articles

1. **Using the Search Box**:  
 - Enter the title of the article you want to find in the search box at the top of the page.
2. **Execute the Search**:  
  - Click the “Search” button, and the system will display articles that match the search criteria.
3. **Reset Search**:   
 - If you need to clear the search criteria, you can click the “Reset” button.

### View Article Details

**Click on the Article Title**:  
  - In the article list, click on the title of the article you want to view, which will usually redirect you to the detailed article page.

### Modify Article

  1. **Click the “Modify” Button**:  
 - In the article list, find the article you want to modify, and click the “Modify” button in that article's row.
 2. **Edit Article**: 
 - The system will redirect to the article editing page, where you can modify the article's title, content, and other information.
 3. **Save Changes**:   
 - After completing the modifications, click the "OK" button to save the changes.

 ### Delete Article

 1. **Click the "Delete" Button**: 
 - In the article list, find the article you want to delete and click the "Delete" button on that article's row.
 2. **Confirm Deletion**: 
 - The system may pop up a confirmation dialog asking if you are sure you want to delete the article; click "OK" to confirm deletion.


 ### Managing Article Types

 1. **Access Article Type Management**: 
   - In the left navigation bar, click on "Article Types" to manage the categories of articles.
 2. **Add or Modify Types**: 
  - On the article type management page, you can add new article types or modify existing ones.

### Adding a New Article
  
![Add Article Page](images/article%20%20%20ADD.png)
Here is a detailed description of this page:
1. **Title**:
- Used to input the title of the article. 
   **Subtitle**: Write the subtitle.
2. **Category**:
- There is a dropdown menu to select the category of the article.
3. **Content**:
- Used to input the main content of the article. Above the editing box, there are some text formatting tools, such as bold, italic, list, link, etc.to facilitate user editing.

The design of this add article page allows users to easily create and edit articles while providing a real-time preview function to check the final effect of the article before publishing.

**The article list function in the backend management system provides users with multiple conveniences. Its intuitive interface design allows even non-technical users to easily get started and perform operations such as adding, deleting, modifying, and querying articles.**