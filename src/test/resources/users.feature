Feature: User
    @Marcos
    Scenario: create and update user for my project task

        Given I have authentication to todo.ly
    # consumiendo el request
        When I send POST request 'api/user.json' with json
    """
    {
       "Email": "marcos1114@mod4.com",
       "FullName": "Marcos Rafael",
       "Password": "123456*"
    }
    """
    # verificar el response
        Then I expected the response code 200
        And I expected the response body is equal
    """
    {
       "Id": EXCLUDE,
       "Email": "marcos1114@mod4.com",
       "Password": null,
       "FullName": "Marcos Rafael",
       "TimeZone": 0,
       "IsProUser": false,
       "DefaultProjectId": EXCLUDE,
       "AddItemMoreExpanded": false,
       "EditDueDateMoreExpanded": false,
       "ListSortType": 0,
       "FirstDayOfWeek": 0,
       "NewTaskDueDate": EXCLUDE,
       "TimeZoneId": "EXCLUDE"
    }
    """

        And I get the property value 'Email' and save on New_Email_USER
        # And I get the property value 'Content' and save on NAME_USER

        When I send PUT request 'api/user/0.json' with json
    """
    {
        "Email": "1New_Email_USER"
    }
    """

    # verificar el response

        Then I expected the response code 200
        And I expected the response body is equal
    """
    {
       "Id": EXCLUDE,
       "Email": "1New_Email_USER",
       "Password": null,
       "FullName": "EXCLUDE",
       "TimeZone": 0,
       "IsProUser": false,
       "DefaultProjectId": EXCLUDE,
       "AddItemMoreExpanded": false,
       "EditDueDateMoreExpanded": false,
       "ListSortType": 0,
       "FirstDayOfWeek": 0,
       "NewTaskDueDate": EXCLUDE,
       "TimeZoneId": "EXCLUDE"
    }
    """

        Then I expected the response code 200