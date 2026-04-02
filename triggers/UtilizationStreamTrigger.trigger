trigger UtilizationStreamTrigger on Utilization_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationStreamHandler.handleAfterDelete(Trigger.old);
    }
}
