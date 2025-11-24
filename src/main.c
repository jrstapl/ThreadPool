#include <stdlib.h>

#include "threadpool.h"

int main() {

  threadpool_t pool;
  threadpool_init(&pool);

  for (int i = 0; i < 100; i++) {
    int *task_num = malloc(sizeof(int));
    *task_num = i;
    threadpool_add_task(&pool, example_task, task_num);
  }

  sleep(30);
  threadpool_destroy(&pool);

  return 0;
}
