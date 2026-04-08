trigger QualityStreamTrigger on Quality_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityStreamHandler.handleAfterDelete(Trigger.old);
    }
}
