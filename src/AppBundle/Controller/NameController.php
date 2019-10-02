<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Name;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Name controller.
 *
 * @Route("name")
 */
class NameController extends Controller
{
    /**
     * Lists all name entities.
     *
     * @Route("/", name="name_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $names = $em->getRepository('AppBundle:Name')->findAll();

        return $this->render('name/index.html.twig', array(
            'names' => $names,
        ));
    }

    /**
     * Creates a new name entity.
     *
     * @Route("/new/{idlesson}", name="name_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request, $idlesson=null)
    {
        $em = $this->getDoctrine()->getManager();


        $lesson =  $names = $em->getRepository('AppBundle:lesson')->findOneById($idlesson);

        
        $name = new Name();
        $name->setLesson($lesson) ;
        $form = $this->createForm('AppBundle\Form\NameType', $name);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($name);
            $em->flush();

            return $this->redirectToRoute('lesson_show', array('id' => $name->getLesson()->getId() ));
          
        }

        return $this->render('name/new.html.twig', array(
            'name' => $name,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a name entity.
     *
     * @Route("/{id}", name="name_show")
     * @Method("GET")
     */
    public function showAction(Name $name)
    {
        $deleteForm = $this->createDeleteForm($name);

        return $this->render('name/show.html.twig', array(
            'name' => $name,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing name entity.
     *
     * @Route("/{id}/edit", name="name_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Name $name)
    {
        $deleteForm = $this->createDeleteForm($name);
        $editForm = $this->createForm('AppBundle\Form\NameType', $name);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('name_edit', array('id' => $name->getId()));
        }

        return $this->render('name/edit.html.twig', array(
            'name' => $name,
            'form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a name entity.
     *
     * @Route("del/{id}", name="name_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Name $name)
    {
        $form = $this->createDeleteForm($name);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            dump("delete" ) ;
            $em = $this->getDoctrine()->getManager();
            $em->remove($name);
            $em->flush();
        }

        return $this->redirectToRoute('name_index');
    }

    /**
     * Creates a form to delete a name entity.
     *
     * @param Name $name The name entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Name $name)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('name_delete', array('id' => $name->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
