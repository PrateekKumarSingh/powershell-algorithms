. $PSScriptRoot\LinkedListNode.ps1

class LinkedList {
    $head
    $tail

    [object] Append($value) {
        $newNode = New-Object LinkedListNode($value);

        # If there is no head yet let's make new node a head.
        if (!$this.head) {
            $this.head = $newNode
            $this.tail = $newNode
            return $this
        }

        # Attach new node to the end of linked list.
        $this.tail.next = $newNode
        $this.tail = $newNode
        return $this
    }

    [object] ToArray() {
        $nodes = @()
        $currentNode = $this.head
        while ($currentNode) {
            $nodes += ($currentNode)
            $currentNode = $currentNode.next
        }

        return $nodes
    }

    [string]ToString() {
        return ($this.ToArray() -join ",")
    }
}