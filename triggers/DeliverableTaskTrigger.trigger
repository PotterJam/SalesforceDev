trigger DeliverableTaskTrigger on Deliverable_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTaskHandler.handleAfterDelete(Trigger.old);
    }
}
