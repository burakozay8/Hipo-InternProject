# Hipo-InternProject

Hipo Intern Project

First of all I created my project in Xcode. The project called “HipoIntern”. HipoIntern is a Swift language project and uses Storyboards for interface.

Creating Models 

I import my local JSON file who named “hipojson.json” in the project.
After that I create my Codable models in “Models.swift” file. My main struct is “Company” and it holds company, team and members. members is an array of my sub struct “Members”. Members struct holds name, age, location, github and Hipo. Hipo is a sub struct of Members and it holds position and years_in_hipo. Finally I created a variable called “userData” to use it throughout the project.(userData is variable of  Company)

2.    Members Screen

After the models I continue with layout. In Main.storyboard you can see the all ViewControllers I created. there is a tableView and there are two buttons in MembersViewController. I used tableView to showing members and sorting them later. Buttons for sorting and adding new member.

To extract the data from JSON file I created a function called “ParseJSON” in MembersViewController. ParseJSON pulls data as URL, decodes the JSON data and assign it to Company. Now my data should be able to use in project. After this actions I used basic tableView functions “NumberOfRowsInsection” and “CellForRowAt” to list members in screen.

3.    Showing Details

For showing all informations about members I created a ViewController called “DetailsViewController”.  I preferred Text Fields to show informations. In userData.members array, I used an integer global variable called “CurrentIndex” . When user taps a member in tableView, didSelectRow function is called. In didSelectRow CurrentIndex synchronizes to IndexPath.row and takes the user to the details of the exact member they want with a segue.


4.    Sorting

In “SortingFunctionsFile.Swift” I have prepared my function that applies all the rules you have given based on the Selection Sort algorithm. The problem I encountered here was not being able to sort the last names directly. Therefore I created a lastNameArray-in MembersVC- and used split to obtain surnames. When I was going to sort last names, I created a dictionary to make it possible to sort the original names. Later I sorted the last names for the character “a”. After that I create an array called “sortedArray”. I appended the values of the sorted surnames -which are my dictionary’s keys- to this array by doing the necessary if check. And finally I insert the listed names in sortedArray to userData.members, which is the main array I use in my project, and remove the duplicate values.

5.    Add a New Member

For adding a new member to my list I wrote a function called “WriteJSON”. WriteJSON is encoding the data and It makes userData ready to append new element. After making the necessary checks to protect the App, Whatever is typed in the Text Fields is appended to userData.members and this record is provided locally with WriteJSON. Even when you restart the App you can see your new member at the bottom of the list, access its details and perform the sorting process.

6. Problems & Bugs

Because of  I added the new member locally, I think it is not possible to appear in a different simulator. That’s why I am sending you the images of the appended version as an attachment. But of course there will be no problem when you add a new member while testing the application.
