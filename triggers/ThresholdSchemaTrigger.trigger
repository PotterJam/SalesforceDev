trigger ThresholdSchemaTrigger on Threshold_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
