trigger FrequencySchemaTrigger on Frequency_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencySchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencySchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencySchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencySchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencySchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencySchemaHandler.handleAfterDelete(Trigger.old);
    }
}
