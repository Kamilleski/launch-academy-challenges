## HTTP Questions

These questions will help to reinforce your understanding of the HTTP protocol. Use the readings on HTTP, your notes, your peers, and good-old trusty Google to answer the following questions:

* * *
**Q: What are the five HTTP verbs we use to Create, Read, Update, and Delete resources on the web?**

A:
GET
PUT
POST
PATCH
DELETE

* * *
**Q: Define each of the HTTP verbs in question #1.**

A:
GET:
PUT:
POST:
PATCH:
DELETE:

* * *
**Q: What are the components of a HTTP request?**

A:
1. HTTP Verb
2. Protocol and version
3. Path
4. Headers

* * *
**Q: What are the components of a HTTP response?**

A:
1. Protocol and version
2. Status code and message
3. Headers
4. Body

* * *
**Q: What is a Status Code?**

A:
The Status code is included in the HTTP response and indicates information about the success/failure of the request, the status of the server/client and other relevant information.



* * *
**Q: What are the different types of Status Codes? List a few Status Codes which you think are important to remember.**

A:
1-- : Informational
2-- : success
3-- : Redirection
4-- : Client error
5-- : Server error
200: OK, 308: Permanent redirect, 403: Forbidden, 500: Internal server error



* * *
**Q: Can you draw the HTTP Request/Response cycle from memory?**

**Note:** It is **highly likely** someone will ask you to do this in an interview setting. Try it out on a whiteboard or on paper, now.

A:



* * *
**Q: What is the difference between the `PUT` and `PATCH` HTTP verbs?**

A:
PATCH partially updates resource and uses less bandwidth than PUT, which updates the resource completely



* * *
**Q: Name the different parts of the following URL**

```
-                      2                             4
            ┌──────────┴──────────┐         ┌────────┴────────┐
    https://learn.launchacademy.com/searches?utf8=✓&query=rspec
    └─┬─┘                          └───┬───┘
      1                                3
```

A:

    1. Scheme

    2. Host Name

    3. Path

    4. Query String

* * *
