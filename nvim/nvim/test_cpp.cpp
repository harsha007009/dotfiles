#include <vector>
#include <iostream>
#include <string>

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5};
    std::string greeting = "Hello, World!";
    
    for (const auto& num : numbers) {
        std::cout << num << " ";
    }
    
    std::cout << std::endl << greeting << std::endl;
    
    return 0;
}
