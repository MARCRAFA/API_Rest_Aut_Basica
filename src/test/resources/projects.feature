Feature: Project
  @Marcos
  Scenario: As a user I want to create a project so that organize my task

    Given I have authentication to todo.ly
    # consumiendo el request
    When I send POST request 'api/projects.json' with json
    """
    {
       "Content":"EXAMEN-MOD4",
       "Icon": 4
    }
    """
    # verificar el response
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": "EXCLUDE",
        "Content": "EXAMEN-MOD4",
        "ItemsCount": 0,
        "Icon": 4,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "EXCLUDE",
        "Children": [],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """

    And I get the property value 'Id' and save on ID_PROJECT
    And I get the property value 'Content' and save on NAME_PROJECT

    When I send PUT request 'api/projects/ID_PROJECT.json' with json
    """
    {
       "Content":"NAME_PROJECT UPDATE",
       "Icon": 4
    }
    """

    # verificar el response

    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": ID_PROJECT,
        "Content": "NAME_PROJECT UPDATE",
        "ItemsCount": 0,
        "Icon": 4,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "EXCLUDE",
        "Children": [],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """

    When I send DELETE request 'api/projects/ID_PROJECT.json' with json
    """
    """
    Then I expected the response code 200