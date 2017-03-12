<?php
namespace edwvee;
class SeekableFileIterator implements \SeekableIterator
{
    protected $_f;
    protected $_pos;
    protected $_val;
    protected $_valid;
    
    public function __construct(String $fileName)
    {
        $this->_f = @fopen($fileName, 'r');
        if (!$this->_f)
            throw new \Exception(
                'Can\'t open file: ' . error_get_last()['message']
            );
        $this->_pos = 0;
    }
    
    public function __destruct()
    {
        fclose($this->_f);
    }
    
    public function seek($pos)
    {
        $this->_pos = $pos;
        fseek($this->_f, $pos);
        $this->_readCurrent();
        if (!$this->_valid)
            throw new \OutOfBoundsException();
    }
    
    public function current(): String
    {
        return $this->_val;
    }
    
    public function key(): int
    {
        return $this->_pos;
    }
    
    public function next()
    {
        $this->_pos++;
        $this->_readCurrent();
    }
    
    public function rewind()
    {
        $this->seek(0);
    }
    
    public function valid()
    {
        return $this->_valid;
    }
    
    protected function _readCurrent()
    {
        $val = fread($this->_f, 1);
        if ($val === '')
        {
            $this->_pos = NULL;
            $this->_val = NULL;
            $this->_valid = false;
        }
        else
        {
            $this->_val = $val;
            $this->_valid = true;
        }   
    }
}
