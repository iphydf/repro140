import           Data.Primitive.ByteArray

main = do
    arr <- newByteArray 1234
    print $ sizeofMutableByteArray $ arr
