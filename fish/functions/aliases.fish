function clang++ --wraps clang++ --description 'alias clang++ with flags'
    /usr/bin/clang++ -Wall -Wextra -Werror -pedantic -std=c++20 $argv
end

function g++ --wraps g++ --description 'alias g++ with flags'
    /usr/bin/g++ -Wall -Wextra -Werror -pedantic -std=c++20 $argv
end
