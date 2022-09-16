// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract Student
{
    struct Marks
    {
        uint Eng_Marks;
        uint Hin_Marks;
        uint Mat_Marks;
    }
    Marks[] public marks;

    mapping(string => Marks) public store;

    function addMarks(string memory name, uint sub1, uint sub2, uint sub3) public 
    {
        marks.push(Marks(sub1,sub2,sub3));
        store[name] = Marks(sub1,sub2,sub3);
    } 

    function percentage(string memory Students) public view returns(uint)
    {
        Marks memory marksName = store[Students];
        uint totalMark = marksName.Eng_Marks + marksName.Hin_Marks + marksName.Mat_Marks;
        return (totalMark*100)/300;
    }

}
