#include <iostream>

int main()
{
    std::cout << "this is example" << std::endl;
#if ENABLE_DEFINITION1
    std::cout << "true" << std::endl;
#else
    std::cout << "false" << std::endl;
#endif
#if ENABLE_DEFINITION2
    std::cout << "true" << std::endl;
#else
    std::cout << "false" << std::endl;
#endif
    return 0;
}
