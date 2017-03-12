<?php
require_once "../SeekableFileIterator.php";
use PHPUnit\Framework\TestCase;

class SeekableFileIteratorTest extends TestCase
{
    private $_it;
    private $_filePath;
    const FILE_DATA = 'abcdef';
    const INDEX_SEQUENCE = '012345';
    const FILE_NAME = 'test_file';
    
    protected function setUp()
    {
        $this->_filePath = __DIR__ . '/' . self::FILE_NAME;
        file_put_contents($this->_filePath, self::FILE_DATA);
        $this->_it = new edwvee\SeekableFileIterator($this->_filePath);
    }
    
    protected function tearDown()
    {
        $this->_it = NULL;
        unlink($this->_filePath);
    }
    
    public function testForeach()
    {
        $indexSequence = '';
        $data = '';
        foreach ($this->_it as $k => $v)
        {
            $indexSequence .= $k;
            $data .= $v;
        }
        
        $this->assertEquals(self::INDEX_SEQUENCE, $indexSequence);
        $this->assertEquals(self::FILE_DATA, $data);
    }
    
    public function testRewind()
    {
        $it = $this->_it;
        $it->rewind();
        $this->assertEquals(0, $it->key());
        $this->assertEquals(self::FILE_DATA[0], $it->current());
    }
    
    public function testValidSeek()
    {
        $it = $this->_it;
        $it->seek(3);
        $this->assertEquals(true, $it->valid());
        $this->assertEquals(3, $it->key());
        $this->assertEquals(self::FILE_DATA[3], $it->current());
    }
    
    /**
     * @expectedException \OutOfBoundsException   
     */
    public function testInvalidSeek()
    {
        $it = $this->_it;
        $it->seek(strlen(self::FILE_DATA));
        $this->assertEquals(false, $it->valid());
        $this->assertEquals(NULL, $it->key());
    }
    
    /**
     * @expectedException \Exception    
     */
    public function testCantOpenFile()
    {
        new edwvee\SeekableFileIterator('');
    }
}