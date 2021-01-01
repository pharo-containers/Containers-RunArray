"
SUnit tests for class CTRunArray
"
Class {
	#name : #CTRunArrayTest,
	#superclass : #TestCase,
	#instVars : [
		'runArray',
		'runArrayNumbers'
	],
	#category : #'Containers-RunArray-Tests'
}

{ #category : #'tests - instance creation' }
CTRunArrayTest >> classToTest [

	^ CTRunArray
]

{ #category : #running }
CTRunArrayTest >> newRunArray [

	^ self classToTest new

]

{ #category : #running }
CTRunArrayTest >> setUp [ 
	super setUp.
	runArray := #($a $b $b $c $c $c $d $d $d $d) as: self classToTest.
	runArrayNumbers := self classToTest new: 5 withAll: 2.

]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testANewCTRunArrayIsEmpty [

	self assertEmpty: self classToTest new
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testANewRunArrayIsEmpty [

	self assertEmpty: self classToTest new
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAdd [

	| run |
	run := self newRunArray.
	self assert: run size equals: 0.

	run add: $A.
	self assert: run size equals: 1.
	run add: $A.
	self assert: run size equals: 2.
	run add: $B.
	self assert: run size equals: 3
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAddAddsAsLastElement [

	| run |
	run := self newRunArray.
	self assert: run size equals: 0.
	run add: $A.
	run add: $A.
	run add: $B.
	self assert: (run at: 3) equals: $B
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAddFirst [

	runArray addFirst: $z.
	self assert: runArray asArray  equals: #($z $a $b $b $c $c $c $d $d $d $d)
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAddFirstWithSameStartingElement [

	runArray addFirst: $a.
	self assert: runArray asArray  equals: #($a $a $b $b $c $c $c $d $d $d $d)
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAddLast [

	runArray addLast: $z.
	self assert: runArray asArray  equals: #( $a $b $b $c $c $c $d $d $d $d $z)
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAddLastWithSameEndingElement [

	runArray addLast: $d.
	self assert: runArray asArray  equals: #($a $b $b $c $c $c $d $d $d $d $d)
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testAddWithOccurrences [ 

	| run |
	run := self newRunArray.
	self assert: run size equals: 0.

	run add: $A withOccurrences: 5.
	self assert: run size equals: 5.
	run add: $A withOccurrences: 3.
	self assert: run size equals: 8.
	run add: $B.
	self assert: run size equals: 9
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testAllSatisfy [
	
	self assert: (runArray allSatisfy: [ :each | each isCharacter ])
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testAllSatisfyFalse [
	
	runArray add: 11.
	self deny: (runArray allSatisfy: [ :each | each isCharacter ])
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testAnySatisfy [
	
	self assert: (runArray anySatisfy: [ :each | each isCharacter ])
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testAnySatisfyFalse [
	
	self deny: (runArray anySatisfy: [ :each | each isNumber ])
	
]

{ #category : #'tests - converting' }
CTRunArrayTest >> testAsBag [

	| bag |
	bag := runArray asBag.
	self assert: bag class equals: Bag.
	self assert: (bag occurrencesOf: $a) equals: 1.
	self assert: (bag occurrencesOf: $b) equals: 2.
	self assert: (bag occurrencesOf: $c) equals: 3.
	self assert: (bag occurrencesOf: $d) equals: 4.
]

{ #category : #'tests - converting' }
CTRunArrayTest >> testAsSet [

	| set |
	set := runArray asSet.
	self assert: set class equals: Set.
	self assert: (set includes: $a). 
	self assert: (set includes: $b).
	self assert: (set includes: $c).
	self assert: (set includes: $d).
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testAt [

	self assert: (runArrayNumbers at: 3) equals: 2.
	self assert: runArrayNumbers asArray equals: #(2 2 2 2 2).
	runArrayNumbers at: 3 put: 5.
	self assert: (runArrayNumbers at: 3) equals: 5
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testAt2 [
	
	self assert: (runArray at: 3) equals: $b.
	self assert: (runArray at: 1) equals: $a.
	self assert: (runArray at: 6) equals: $c.
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testAtPut [

	runArrayNumbers at: 3 put: 5.
	self assert: runArrayNumbers asArray equals: #( 2 2 5 2 2 ).

	runArrayNumbers at: 1 put: 1.
	self assert: runArrayNumbers asArray equals: #( 1 2 5 2 2 )
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testAtPut2 [

	| array |
	array := self classToTest new: 5 withAll: 2.

	self should: [ array at: 0 put: 5 ] raise: Error.
	self should: [ array at: 6 put: 5 ] raise: Error.
	self should: [ array at: $b put: 5 ] raise: Error
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testAtPutChangingStartBorder [
	"runArray := #($a $b $b $c $c $c $d $d $d $d)a"

	runArray at: 2 put: $a.
	self assert: (runArray at: 3) equals: $b.
	self assert: runArray asArray equals: #($a $a $b $c $c $c $d $d $d $d)
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testAtPutOutOfRangeRaiseError [

	self should: [ runArrayNumbers at: 0 put: 5 ] raise: Error.
	self should: [ runArrayNumbers at: 6 put: 5 ] raise: Error.
	self should: [ runArrayNumbers at: $b put: 5 ] raise: Error
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testCollect [
	
	| collectedRuns |
	collectedRuns := (runArray collect: [ :each | each isNumber ]).
	self assert: collectedRuns class equals: runArray class.
	self assert: collectedRuns runs equals: #(10).
	self assert: collectedRuns values first equals: false
	
]

{ #category : #'tests - copying' }
CTRunArrayTest >> testConcatenate [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray, runArray.
	self assert: rArray runs equals: runArray runs, runArray runs. 
	self assert: rArray values equals: runArray values, runArray values. 
]

{ #category : #'tests - copying' }
CTRunArrayTest >> testConcatenateWithEmpty [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := self newRunArray, runArray, self newRunArray.
	self assert: rArray runs equals: runArray runs. 
	self assert: rArray values equals: runArray values. 
]

{ #category : #'tests - copying' }
CTRunArrayTest >> testConcatenateWithSameEnding [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray, (self newRunArray add: $d; add: $d; yourself).
	self assert: rArray runs equals: #(1 2 3 6). 
	self assert: rArray values equals: runArray values. 
]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopy [
	| similarRun |
	similarRun := runArray copy.
	self assert: similarRun runs equals: runArray runs. 
	self assert: similarRun values equals: runArray values. 
]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyFromTo [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray copyFrom: 2 to: 6.
	self assert: rArray runs equals: #(2 3). 
	self assert: rArray values equals: #($b $c)
]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyReplaceFromToWith [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray copyReplaceFrom: 2 to: 4 with: #($z $z).
	self assert: rArray runs equals: #(1 2 2 4).
	self assert: rArray values equals: #($a $z $c $d)

]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyUpThrough [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray copyUpTo: $d.
	self assert: rArray runs equals: #(1 2 3).
	self assert: rArray values equals: #($a $b $c)

]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyUpThrough2 [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray copyUpThrough: $c.
	self assert: rArray runs equals: #(1 2 3).
	self assert: rArray values equals: #($a $b $c)

]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyUpTo [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	rArray := runArray copyUpTo: $c.
	self assert: rArray runs equals: #(1 2).
	self assert: rArray values equals: #($a $b)

]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyUpToLast [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray rArray2 |
	rArray := #($a $b $b $c $c $c $d $d $a $d $d)as: self classToTest.
	rArray2 := rArray copyUpToLast: $a.
	self assert: rArray2 runs equals: #(1 2 3 2).
	self assert: rArray2 values equals: #($a $b $c $d)

]

{ #category : #'tests - copying' }
CTRunArrayTest >> testCopyWithWrongFromTo [
	"#($a $b $b $c $c $c $d $d $d $d)"

	| rArray |
	"I could not test what is happening when the start is negative
	rArray := runArray copyFrom: -2 to: 6.
	the result was false. should probably be for a future version of the RunArray definition"
	
	rArray := runArray copyFrom: 6 to: 2.
	self assert: rArray equals: self newRunArray

]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testCount [
	
	self assert: (runArray count: [ :each | each = $d ]) equals: 4.
	self assert: (runArray count: [ :each | each = $z ]) equals: 0.
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testDetectIfNone [

	| found |
	found := runArray detect: [ :each | each = $z ] ifNone: [ 33 ].
	self assert: found  equals: 33
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testDetectMax [

	| found |
	found := runArray detectMax: [ :each | each ].
	self assert: found equals: $d
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testDetectMax2 [

	| found |
	found := (runArray add: $a; yourself) detectMax: [ :each | each ].
	self assert: found equals: $d
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testDetectMin [

	| found |
	found := (runArray add: $a; yourself) detectMin: [ :each | each codePoint ].
	self assert: found equals: $a
	
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testDetectSum [

	| found |
	found := runArray detectSum: [ :each | each codePoint ].
	self assert: found equals: 990
	
]

{ #category : #'tests - iteration' }
CTRunArrayTest >> testFillFromWith [
	
	| newRun |
	newRun := self newRunArray. 
	newRun fillFrom: #($a $b $c $c $d) with: [ :each | each digitValue ].
	self assert: (newRun at: 1) equals: 10.
	self assert: (newRun at: 3) equals: 12.
	self assert: (newRun at: 4) equals: 12.
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testFirst [

	self assert: runArrayNumbers first equals: 2.
	self assert: runArray first equals: $a
]

{ #category : #'tests - testing' }
CTRunArrayTest >> testIncludes [

	self assert: (runArray includes: $c).
	self deny: (runArray includes: $z).
]

{ #category : #'tests - testing' }
CTRunArrayTest >> testIsEmpty [

	self assert: self newRunArray isEmpty
]

{ #category : #'tests - self evaluation' }
CTRunArrayTest >> testIsSelfEvaluating [ 
	| similarRun |
	"it is delicate to test self evaluation because it is a bit a meta property."
	
	similarRun := (self class compiler evaluate: runArray printString).
	self assert: (runArray isSelfEvaluating).
	self assert: (similarRun isSelfEvaluating).
	self assert: similarRun runs equals: runArray runs. 
	self assert: similarRun values equals: runArray values. 
]

{ #category : #'tests - testing' }
CTRunArrayTest >> testIsSorted [

	self assert: runArray isSorted.
	runArray addLast: $a.
	self deny: runArray isSorted.
]

{ #category : #'tests - testing' }
CTRunArrayTest >> testIsSortedBy [

	self assert: ((#(1 1 2 2 3 3 3 3) as: self classToTest) isSortedBy: [:a :b | a <= b ]).
	self assert: ((#(1 1 2 2 3 3 3 3) as: self classToTest) reversed isSortedBy: [:a :b | b <= a ]).
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testLast [
	

	self assert: runArrayNumbers last equals: 2.
	self assert: runArray last equals: $d
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testNew [
	
	| array |
	array := self classToTest new.
	self assert: array size equals: 0
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testNewFromArray [
	
	| array |
	array := self classToTest newFrom: #($a $b $b $b $b $c $c $a).
	self assert: array size equals: 8.
	self assert: array asArray equals: #($a $b $b $b $b $c $c $a)
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testNewFromString [
	
	| array |
	array := self classToTest newFrom: 'abbbbcca'.
	self assert: array size equals: 8.
	self assert: array asArray equals: #($a $b $b $b $b $c $c $a)
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testNewWithAll [

	| array |
	array := self classToTest new: 5 withAll: 2.
	self assert: array asArray equals: #(2 2 2 2 2).
	array at: 3 put: 5.
	self assert: array asArray equals: #(2 2 5 2 2).
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testNewWithSize [
	|array|
	array := self classToTest new: 5.
	self assert: array size equals: 5.
	1 to: 5 do: [:index | self assert: (array at: index) isNil]
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testNoneSatisfy [
	
	self assert: (runArray noneSatisfy: [ :each | each isNumber ])
	
]

{ #category : #'tests - removing' }
CTRunArrayTest >> testRemoveAll [
	"#($a $b $b $c $c $c $d $d $d $d)"

	runArray removeAll.
	self assert: runArray runs isEmpty.
	self assert: runArray values isEmpty

]

{ #category : #'tests - removing' }
CTRunArrayTest >> testRemoveIfAbsent [
	"#($a $b $b $c $c $c $d $d $d $d)"

	runArray remove: $c ifAbsent: $z.
	self assert: runArray runs equals: #(1 2 2 4).
	self assert: runArray values equals: #($a $b $c $d)

]

{ #category : #'tests - removing' }
CTRunArrayTest >> testRemoveIfAbsentNotFound [
	"#($a $b $b $c $c $c $d $d $d $d)"

	runArray remove: $z ifAbsent: $z.
	self assert: runArray runs equals: #(1 2 3 4).
	self assert: runArray values equals: #($a $b $c $d)

]

{ #category : #'tests - adding' }
CTRunArrayTest >> testRepeatLastifEmptyWhenEmpty [

	| newRun sizeBefore |
	newRun := self newRunArray.
	sizeBefore := newRun size.
	newRun repeatLast: 4 ifEmpty: [ $W ].
	self assert: newRun size equals: sizeBefore + 4.
	self assert: newRun asArray equals: #( $W $W $W $W )
]

{ #category : #'tests - adding' }
CTRunArrayTest >> testRepeatLastifEmptyWhenNotEmpty [

	| sizeBefore |
	sizeBefore := runArray size.
	runArray repeatLast: 4 ifEmpty: [ $W ].
	self assert: runArray size equals: sizeBefore + 4.
	self assert: runArray asArray equals: #( $a $b $b $c $c $c $d $d $d $d $d $d $d $d )
]

{ #category : #'tests - change state' }
CTRunArrayTest >> testReversed [ 
	
	| reversed | 
	reversed := runArray reversed. 
	self assert: runArray first equals: reversed last. 
	self assert: runArray last equals: reversed first. 
	self assert: runArray size equals: reversed size. 
]

{ #category : #'tests - merging' }
CTRunArrayTest >> testRunArrayAdjacentMerge [

	"This demonstrates that adjancent runs with equal attributes are merged."

	| array |
	array := self classToTest new.
	array
		add: TextEmphasis normal withOccurrences: 5;
		add: TextEmphasis bold withOccurrences: 5;
		add: TextEmphasis bold withOccurrences: 5.
	self assert: array runs size equals: 2
]

{ #category : #'tests - merging' }
CTRunArrayTest >> testRunArrayInvariant [

	"This verifies that the fundamental invariant of a CTRunArray is always satisfied.
	 This method is a bit tricky. First, it uses Object>>instVarNamed: to access instance 
	 variables for which no accessors are defined. The same method is used by the debuggers 
	 and by various inspectors. The assertion itself explains the meaning of the cached values."

	| runArray |
	runArray := self classToTest new.
	runArray
		add: TextEmphasis normal withOccurrences: 5;
		add: TextEmphasis bold withOccurrences: 5;
		add: TextEmphasis normal withOccurrences: 5.
	self assert: ((1 to: runArray size) allSatisfy: [ :idx | 
			 | lastIndex lastOffset lastRun lengthOfPreviousRuns |
			 runArray at: idx. " updates the cached values "
			 lastIndex := runArray instVarNamed: 'lastIndex'.
			 lastRun := runArray instVarNamed: 'lastRun'.
			 lastOffset := runArray instVarNamed: 'lastOffset'.
			 lengthOfPreviousRuns := (1 to: lastRun - 1)
				                         inject: 0
				                         into: [ :sum :idx2 | 
				                         sum + (runArray runs at: idx2) ].
			 lastIndex = (lastOffset + lengthOfPreviousRuns + 1) ])
]

{ #category : #'tests - merging' }
CTRunArrayTest >> testRunArrayReversal [

	"This tests the reversal of a CTRunArray."

	| runArray |
	runArray := self classToTest new.
	runArray
		add: TextEmphasis normal withOccurrences: 5;
		add: TextEmphasis bold withOccurrences: 5;
		add: TextEmphasis normal withOccurrences: 5.
	self assert: runArray reversed runs size equals: 3
]

{ #category : #'tests - merging' }
CTRunArrayTest >> testRunArrayRunsAreNotMerged [

	"This demonstrates that different runs are not merged."

	| runArray |
	runArray := self classToTest new.
	runArray
		add: TextEmphasis normal withOccurrences: 5;
		add: TextEmphasis bold withOccurrences: 5;
		add: TextEmphasis normal withOccurrences: 5.
	self assert: runArray runs size equals: 3
]

{ #category : #'tests - merging' }
CTRunArrayTest >> testRunArrayRunsSize [

	"This demonstrates that the size of a run array is the sum of the sizes of its runs."

	| runArray |
	runArray := self classToTest new.
	runArray
		add: TextEmphasis normal withOccurrences: 5;
		add: TextEmphasis bold withOccurrences: 5;
		add: TextEmphasis normal withOccurrences: 5.
	self assert: runArray size equals: 15
]

{ #category : #'tests - accessing' }
CTRunArrayTest >> testRunLengthAt [
	
	| array |
	array := #($a $b $b $c $c $c $d $d) as: self classToTest.
             "1   2  3  4  5  6  7  8 "	
	self assert: (array runLengthAt: 1) equals: 1.
	"there is only on $a to go"
	self assert: (array runLengthAt: 2) equals: 2.
	
	self assert: (array runLengthAt: 3) equals: 1.
	"there is only on $b to go"
	
	self assert: (array runLengthAt: 4) equals: 3.
	"there are 3 $c to go"
	
	self assert: (array runLengthAt: 5) equals: 2.
	self assert: (array runLengthAt: 6) equals: 1.
	self assert: (array runLengthAt: 7) equals: 2.
	self assert: (array runLengthAt: 8) equals: 1.
]

{ #category : #'tests - private' }
CTRunArrayTest >> testRuns [

	self assert: runArray runs equals: #(1 2 3 4).
	self assert: (runArray addLast: runArray first ; runs) equals: #(1 2 3 4 1).
	
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testRunsValues [
	
	| array |
	array := self classToTest runs: #(1 4 2 1) values: #($a $b $c $a).
	self assert: array size equals: 8.
	self assert: array asArray equals: #($a $b $b $b $b $c $c $a)
]

{ #category : #'tests - instance creation' }
CTRunArrayTest >> testScanFromANSICompatibility [
 	self flag: #WhereAreTheAssertionsBoy.
	self classToTest scanFrom: '()f1dNumber new;;' readStream.
	self classToTest scanFrom: '()a1death;;' readStream.
	self classToTest scanFrom: '()F1death;;' readStream
]

{ #category : #'tests - enumerating' }
CTRunArrayTest >> testSelect [
	| lessThanC |
	lessThanC := runArray select: [ :each | each < $c ].
	self assert: lessThanC runs equals: #(1 2).
	self assert: lessThanC values equals: #($a $b).
]

{ #category : #'tests - private' }
CTRunArrayTest >> testValues [

	self assert: runArray values  equals: #($a $b $c $d).
	self assert: (runArray addLast: runArray first ; values) equals: #($a $b $c $d $a).
]

{ #category : #'tests - iteration' }
CTRunArrayTest >> testWithStartStopAndValueDo [
	
	| array elements startStops |
	array := #($a $b $b $c $c $c $d $d) as: CTRunArray.
	elements := OrderedCollection new.
	startStops := OrderedCollection new.
	array withStartStopAndValueDo: [:start :stop :value | elements add: value. startStops add: start->stop].
	
	self assert: elements asArray equals: #($a $b  $c  $d).
	self assert: startStops asArray equals: {1->1 . 2->3 . 4->6 . 7->8}
]
