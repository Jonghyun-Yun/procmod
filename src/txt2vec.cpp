#include "txt2vec.h"

// read lines to int vectors
std::vector<std::vector<int>> txt2vec(std::ifstream &file_in) {
  std::vector<std::vector<int>> vec;

  if (!file_in) { /*error*/
  }

  std::string line;
  while (std::getline(file_in, line)) {
    std::istringstream ss(line);
    vec.emplace_back(std::istream_iterator<int>(ss),
                     std::istream_iterator<int>());
  }
  return vec;
}
