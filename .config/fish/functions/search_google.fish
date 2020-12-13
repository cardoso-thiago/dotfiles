function google -d "Add a search in google function"
    xdg-open "https://www.google.com/search?q=$argv" > /dev/null 2>&1
end
