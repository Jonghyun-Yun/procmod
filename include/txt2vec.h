#ifndef __TXT2VEC_H_
#define __TXT2VEC_H_

#include <stan/math.hpp>
#include <fstream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

std::vector<std::vector<int>> txt2vec(std::ifstream &file_in);

#endif // __TXT2VEC_H_
