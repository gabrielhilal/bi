
I've implemented two solutions for the problem and included the benchmark to compare them:

### Solution 1

That was my initial idea with some improvements as described in the PR https://github.com/gabrielhilal/bi/pull/1

- The `segment` string starts empty (`''`)
- Iterate over the given string chars
- Push the char to the `segment` string
- Check whether the `segment` is included in the dictionary
- If not included in the dictionary, push the next char to the `segment`
- Check again whether the `segment` is included in the dictionary and so on
- When `segment` is found in the dictionary, it "resets" the `segment` back to empty (`''`)
- If at the end of the interaction the `segment` is empty, it means the given string is valid

### Solution 2

Then I decided to try a solution using recursion to compare with solution 1

- The method receives 3 params (`from`, `to` and `result`)
- `from` and `to` are used to define the chars we want to compare with the dictionary (starting with the first char - from `0` to `1`)
- The `result` starts as `false` and will be used to define if the given word is valid or not
- The method will check if the string segment is found in the dictionary, starting with the first char (from 0 to 1)
- If not included in the dictionary, the `to` gets incremented and `result` is set to false
- Then the method is called again (recursion), and it checks whether the segment is included in the dictionary, and so on
- When the segment is found in the dictionary, it changes the `result` to true and starts checking the next segment (`from` becomes `to` + 1)
- The recursion will stop at the end of the string and the `result` (true or false) is returned


### Benchmark

```
ruby benchmark.rb

       user     system      total        real
first approach  (without recursion) 11.631065   0.020708  11.651773 ( 11.655235)
second approach (with recursion)    12.250361   0.020865  12.271226 ( 12.271461)
````
