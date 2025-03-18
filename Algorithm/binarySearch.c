#include <stdio.h>
#include <stdlib.h>

struct Node{
    int data;
    struct Node* left;
    struct Node* right;
};

struct Node* createNode(int value){
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data=value;
    newNode->left=newNode->right=NULL;
    return newNode;
}

struct Node* insert(struct Node* root,int value){
    if(root==NULL){
        return createNode(value);
    }
    if(value<root->data){
        root->left=insert(root->left,value);
    }
    else if(value>root->data){
        root->right=insert(root->right,value);
    }
    
    return root;
}

void inorderTraversal(struct Node* root) {
    if (root != NULL) {
        inorderTraversal(root->left);
        printf("%d ", root->data);
        inorderTraversal(root->right);
    }
}.

int main() {
    struct Node* root = NULL;
    
    root = insert(root, 45);
    insert(root, 15);
    insert(root, 79);
    insert(root, 90);
    insert(root, 10);
    insert(root, 55);
    insert(root, 12);
    insert(root, 20);
    insert(root, 50);
    
    printf("In-order Traversal \n");
    inorderTraversal(root);
    
    return 0;
}