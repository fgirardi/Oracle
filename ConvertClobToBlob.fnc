FUNCTION ConvertClobToBlob(pClob IN CLOB) RETURN BLOB IS

 BlobResult        BLOB;                          
 BlobResult_offset INTEGER := 1;
 vSourceOffset     INTEGER := 1;
 vLangContext      INTEGER := dbms_lob.default_lang_ctx;
 vWarning          INTEGER := dbms_lob.warn_inconvertible_char;

BEGIN

  dbms_lob.createtemporary(BlobResult, true);
  
  dbms_lob.converttoblob(dest_lob    => BlobResult,
                         src_clob    => pClob,
                         amount      => dbms_lob.lobmaxsize,
                         dest_offset => BlobResult_offset,
                         src_offset  => vSourceOffset,
                         blob_csid   => dbms_lob.default_csid,
                         lang_context=> vLangContext,
                         warning     => vWarning);

  RETURN BlobResult;    
                              
END ConvertClobToBlob;