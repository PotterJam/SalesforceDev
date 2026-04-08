trigger DeliverableRecordTrigger on Deliverable_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRecordHandler.handleAfterDelete(Trigger.old);
    }
}
