CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:                         'Google',
        google_storage_access_key_id:     'GOOGH4ZLOQEZONXXIYKJBIZB',
        google_storage_secret_access_key: 'xjBZxadzTREmVzgokMxruP56C3of3MbsXlI2xIJP'    
    }
    config.fog_directory = 'bucket-app-rails'
end