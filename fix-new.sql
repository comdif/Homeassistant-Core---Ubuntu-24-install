-- Event ID
SET @new_event_id = (SELECT MAX(event_id) + 1 FROM events);
SET @query = CONCAT('ALTER TABLE events MODIFY COLUMN event_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_event_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- State ID
SET @new_state_id = (SELECT MAX(state_id) + 1 FROM states);
SET @query = CONCAT('ALTER TABLE states MODIFY COLUMN state_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_state_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Recorder Runs
SET @new_run_id = (SELECT MAX(run_id) + 1 FROM recorder_runs);
SET @query = CONCAT('ALTER TABLE recorder_runs MODIFY COLUMN run_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_run_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Schema Changes
SET @new_change_id = (SELECT MAX(change_id) + 1 FROM schema_changes);
SET @query = CONCAT('ALTER TABLE schema_changes MODIFY COLUMN change_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_change_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- State Attributes
SET @new_attributes_id = (SELECT MAX(attributes_id) + 1 FROM state_attributes);
SET @query = CONCAT('ALTER TABLE state_attributes MODIFY COLUMN attributes_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_attributes_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Event Data
SET @new_data_id = (SELECT MAX(data_id) + 1 FROM event_data);
SET @query = CONCAT('ALTER TABLE event_data MODIFY COLUMN data_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_data_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Statistics Runs
SET @new_statistics_run_id = (SELECT MAX(run_id) + 1 FROM statistics_runs);
SET @query = CONCAT('ALTER TABLE statistics_runs MODIFY COLUMN run_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_statistics_run_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- States Meta
SET @new_metadata_id = (SELECT MAX(metadata_id) + 1 FROM states_meta);
SET @query = CONCAT('ALTER TABLE states_meta MODIFY COLUMN metadata_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_metadata_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Event Types
SET @new_event_type_id = (SELECT MAX(event_type_id) + 1 FROM event_types);
SET @query = CONCAT('ALTER TABLE event_types MODIFY COLUMN event_type_id INT NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=', @new_event_type_id);
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;