trigger FrequencyTransformTrigger on Frequency_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyTransformHandler.handleAfterDelete(Trigger.old);
    }
}
