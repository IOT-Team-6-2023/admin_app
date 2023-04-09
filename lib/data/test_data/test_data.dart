String mockTallyResponse = """[{
"candidate": {
"firstName": "John",
"middleName": null,
"lastName": "Doe",
"dateOfBirth": "1990-01-01T00:00:00Z",
"party": 1
},
"voteCount": 123
}]""";

String mockCandidatesResponse = """[{
"firstName": "John",
"middleName": null,
"lastName": "Doe",
"date-of-birth": "1990-01-01T00:00:00Z",
"party": {
"name": "Independent"
}
}]""";

String mockPartiesResponse = """[{
"name": "Independent"
},{
"name": "Republicans"
},{
"name": "Democrats"
}]""";
