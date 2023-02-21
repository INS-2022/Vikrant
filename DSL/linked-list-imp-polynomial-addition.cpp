#include <iostream>
using namespace std;
class Term{
    protected:
    public:
    int coefficient;
    int power;
    Term *term;
    Term(int coefficient,int power, Term *term=NULL){
        this->coefficient = coefficient;
        this->power = power;
        this->term = term;
    }
};

class Polynomial{
    public:
    Term *head;
    Polynomial(){
        head = NULL;
    }
    void addTerm(int coefficient,int power){
        if (head == NULL){
            head = new Term(coefficient,power);
        }
        else{
            Term *temp = head;
            while(temp->term != NULL){
                temp = temp->term;
            }
            temp->term = new Term(coefficient,power);
        }
    }
    void print(){
        Term *temp = head;
        while(temp != NULL){
            if (temp->term == NULL){
                cout<<temp->coefficient<<endl;
                return;
            }
            cout<<temp->coefficient<<"x^"<<temp->power<<"+";
            temp = temp->term;
        }
    }
    

};
Polynomial addPolynomial(Polynomial p1,Polynomial p2){
        Polynomial p3;
        Term *temp1 = p1.head;
        Term *temp2 = p2.head;
        while(temp1 != NULL && temp2 != NULL){
            if (temp1->power == temp2->power){
                p3.addTerm(temp1->coefficient+temp2->coefficient,temp1->power);
                temp1 = temp1->term;
                temp2 = temp2->term;
            }
            else if (temp1->power > temp2->power){
                p3.addTerm(temp1->coefficient,temp1->power);
                temp1 = temp1->term;
            }
            else{
                p3.addTerm(temp2->coefficient,temp2->power);
                temp2 = temp2->term;
            }
        }
        while(temp1 != NULL){
            p3.addTerm(temp1->coefficient,temp1->power);
            temp1 = temp1->term;
        }
        while(temp2 != NULL){
            p3.addTerm(temp2->coefficient,temp2->power);
            temp2 = temp2->term;
        }
        p3.print();
        return p3;
    }
Polynomial operator+(Polynomial p1,Polynomial p2){
    Polynomial p3 = addPolynomial(p1,p2);
    return p3;
}

int main() {
    Polynomial p1,p2;
    cout << "Enter the number of terms in the first polynomial" << endl;
    int n;
    cin>>n;
    for (int i=0;i<n;i++){
        int coefficient,power;
        cout << "Enter the coefficient of the term: ";
        cin>>coefficient;
        cout << "Enter the power of the term: ";
        cin>>power;
        p1.addTerm(coefficient,power);
    }
    cout << "Enter the number of terms in the second polynomial" << endl;
    cin>>n;
    for (int i=0;i<n;i++){
        int coefficient,power;
        cout << "Enter the coefficient of the term: ";
        cin>>coefficient;
        cout << "Enter the power of the term: ";
        cin>>power;
        p2.addTerm(coefficient,power);
    }
    cout<<"The first polynomial is"<<endl;
    p1.print();
    cout<<"The second polynomial is"<<endl;
    p2.print();
    cout << "The sum of the two polynomials is" << endl;
    Polynomial p3 = p1+p2;
    p3.print();
    return 0;

}