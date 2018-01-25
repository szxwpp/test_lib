#include "gtest/gtest.h"

/******************************************* simple test ********************************************/
int Fun(int a, int b)
{
	return (a - b);
}
TEST(FunTest, case1)
{
	EXPECT_EQ(-1, Fun(1, 2));
	ASSERT_EQ(-1, Fun(1, 2));
	ASSERT_LT(1, Fun(1, 2));
	EXPECT_LT(-2, Fun(1, 2));
}
TEST(FunTest, case2)
{
	EXPECT_EQ(-1, Fun(1, 2));
}


#ifdef WIN32
/************************************************* 测试夹具 Fixture  **************************************************/
template <typename E> // E is the element type.
class Queue 
{
public:
	template <typename E>
	struct Node
	{
		Node<E>* next_ptr_;
		E data_;
	};

	Queue()
	{
		Node<E>* node = new Node<E>();
		node->data_ = NULL;
		node->next_ptr_ = nullptr;
		head_ = node;
		tail_ = node;
	}
	void Enqueue(const E& element)
	{
		Node<E>* node = new Node<E>();
		node->data_ = element;
		node->next_ptr_ = tail_;
		head_ = node;
	}
	E* Dequeue()
	{
		if (head_ == tail_)
		{
			return nullptr;
		}
			
		else
		{
			auto ret = &(head_->data_);
			head_ = head_->next_ptr_;
			return ret;
		}
	}
	size_t size()
	{
		size_t count = 0;
		Node<E>* fake_head = head_;
		while (fake_head != tail_)
		{
			count++;
			fake_head = fake_head->next_ptr_;

		}

		return count;
	}


private:
	Node<E>* head_;
	Node<E>* tail_;

};
class QueueTest : public ::testing::Test 
{
protected:
	virtual void SetUp() 
	{
		q1_.Enqueue(1);
		q2_.Enqueue(2);
		q2_.Enqueue(3);
	}

	// virtual void TearDown() {}

	Queue<int> q0_;
	Queue<int> q1_;
	Queue<int> q2_;
};
TEST_F(QueueTest, IsEmptyInitially) 
{
	EXPECT_EQ(0, q0_.size());
}
TEST_F(QueueTest, DequeueWorks) {
	int* n = q0_.Dequeue();
	EXPECT_EQ(nullptr, n);

	n = q1_.Dequeue();
	ASSERT_TRUE(n != nullptr);
	EXPECT_EQ(1, *n);
	EXPECT_EQ(0, q1_.size());

	n = q2_.Dequeue();
	ASSERT_TRUE(n != NULL);
	EXPECT_EQ(2, *n);
	EXPECT_EQ(1, q2_.size());

}
class DeriveQueueTest : public QueueTest
{
	virtual void SetUp()
	{
		QueueTest::SetUp();

		q1_.Enqueue(3);
		q2_.Enqueue(2);
		q2_.Enqueue(1);
	}
};
TEST_F(DeriveQueueTest, DeriveQueue)
{
	int* n = q0_.Dequeue();
	EXPECT_EQ(nullptr, n);

	n = q1_.Dequeue();
	ASSERT_TRUE(n != nullptr);
	EXPECT_EQ(1, *n);
	EXPECT_EQ(0, q1_.size());
}

#endif












int main(int argc, char* argv[])
{

	::testing::InitGoogleTest(&argc, argv);
    auto ret = RUN_ALL_TESTS();

	char a;
	std::cin >> a;

	return 0;
}
